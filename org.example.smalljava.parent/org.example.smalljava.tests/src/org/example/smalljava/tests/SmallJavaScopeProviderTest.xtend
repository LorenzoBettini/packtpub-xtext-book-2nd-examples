package org.example.smalljava.tests

import com.google.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.scoping.IScopeProvider
import org.example.smalljava.SmallJavaModelUtil
import org.example.smalljava.smallJava.SJMemberSelection
import org.example.smalljava.smallJava.SJMethod
import org.example.smalljava.smallJava.SJProgram
import org.example.smalljava.smallJava.SJSymbolRef
import org.example.smalljava.smallJava.SJVariableDeclaration
import org.example.smalljava.smallJava.SmallJavaPackage
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaInjectorProvider)
class SmallJavaScopeProviderTest {
	@Inject extension ParseHelper<SJProgram>
	@Inject extension IScopeProvider
	@Inject extension SmallJavaModelUtil

	@Test def void testScopeProvider() {
		'''
			class C {
			  A f;
			  A m(A p) {
			    A v = null;
			    return null; // return's expression is the context
			  }
			}
			class A {}
		'''.parse.classes.head.methods.last.returnStatement.expression => [
			assertScope(SmallJavaPackage.eINSTANCE.SJMemberSelection_Member, "f, m, C.f, C.m")
			assertScope(SmallJavaPackage.eINSTANCE.SJSymbolRef_Symbol, "v, p")
		]
	}

	@Test def void testScopeProviderForSymbols() {
		'''
			class C {
			  A m(A p) {
			    A v1 = null;
			    if (true) {
			      A v2 = null;
			      A v3 = null;
			    }
			    A v4 = null;
			    return null;
			  }
			}
			class A {}
		'''.parse.classes.head.methods.last.body.eAllContents.filter(SJVariableDeclaration) => [
			findFirst[name == 'v3'].expression.assertScope(SmallJavaPackage.eINSTANCE.SJSymbolRef_Symbol, "v2, v1, p")
			findFirst[name == 'v4'].expression.assertScope(SmallJavaPackage.eINSTANCE.SJSymbolRef_Symbol, "v1, p")
		]
	}

	@Test def void testVariableShadowsParamScoping() {
		'''
		class C {
			A m(A a) {
				A a = null;
				return a;
			}
		}
		class A {}
		'''.parse.classes.head.methods.head => [
			returnStatement.expression.assertScope
				(SmallJavaPackage.eINSTANCE.SJSymbolRef_Symbol, 
				"a")
		]
	}

	@Test def void testVariableShadowsParamLinking() {
		'''
		class A {
			A m(A a) {
				A a = null;
				return a;
			}
		}
		'''.parse.classes.head.methods.head => [
			// the local variable should shadow the param
			body.statements.head.assertSame(
				(returnStatement.expression as SJSymbolRef).symbol)
		]
	}

	@Test def void testFieldsScoping() {
		'''
		class C { 
			C a;
		}
		
		class D extends C {
			C b;
			C m(C p1, D p2) { return this.b; }
		}'''.parse.classes.last.methods.get(0).returnStatement.expression.assertScope(
			SmallJavaPackage.eINSTANCE.SJMemberSelection_Member, "b, m, a")
		// before custom scoping was: "b, m, C.a, D.b, D.m"
	}

	@Test def void testMethodsScoping() {
		'''
		class C { 
			C n() { return null; }
		}
		
		class D extends C {
			C f;
			C m() { return this.m(); }
		}'''.parse.classes.last.methods.get(0).returnStatement.expression.assertScope(
			SmallJavaPackage.eINSTANCE.SJMemberSelection_Member, "m, f, n")
		// before custom scoping was: "m, C.n, D.m"
	}

	@Test def void testFieldScoping() {
		'''
			class A {
			  D a;
			  D b;
			  D c;
			}
			
			class B extends A {
			  D b;
			}
			
			class C extends B {
			  D a;
			  D m() { return this.a; }
			  D n() { return this.b; }
			  D p() { return this.c; }
			}
			class D {}
		'''.parse.classes => [
			// a in this.a must refer to C.a
			get(2).fields.get(0).assertSame(get(2).methods.get(0).returnExpSel.member)
			// b in this.b must refer to B.b
			get(1).fields.get(0).assertSame(get(2).methods.get(1).returnExpSel.member)
			// c in this.c must refer to A.c
			get(0).fields.get(2).assertSame(get(2).methods.get(2).returnExpSel.member)
		]
	}

	@Test def void testMethodScoping() {
		'''
			class A { 
				D n() { return null; }
				D m() { return null; }
				D o() { return null; }
			}
			
			class B extends A { 
				D n() { return null; }
			}
			
			class C extends B {
				D m() { return this.m(); }
				D p() { return this.n(); }
				D q() { return this.o(); }
			}
			class D {}
		'''.parse.classes => [
			// m in this.m() must refer to C.m
			get(2).methods.get(0).assertSame(get(2).methods.get(0).returnExpSel.member)
			// n in this.n() must refer to B.n
			get(1).methods.get(0).assertSame(get(2).methods.get(1).returnExpSel.member)
			// o in this.o() must refer to B.n
			get(0).methods.get(2).assertSame(get(2).methods.get(2).returnExpSel.member)
		]
	}

	@Test def void testMemberScopeWithUnresolvedReceiver() {
		'''
			class C {
			  A m() {
			    return foo.m(); // return's expression is the context
			  }
			}
			class A {}
		'''.parse.classes.head.methods.last.returnStatement.expression => [
			assertScope(SmallJavaPackage.eINSTANCE.SJMemberSelection_Member, "")
		]
	}

	@Test def void testFieldsAndMethodsWithTheSameName() {
		'''
			class C {
			  A f;
			  A f() {
			    return this.f(); // must refer to method f
			  }
			  A m() {
			    return this.m; // must refer to field m
			  }
			  A m;
			}
			class A {}
		'''.parse.classes.head => [
			// must refer to method f()
			methods.head.assertSame(methods.head.returnExpSel.member)
			// must refer to field m
			fields.last.assertSame(methods.last.returnExpSel.member)
		]
	}

	@Test def void testClassesInTheSamePackageInDifferentFiles() {
		val first = '''
			package apackage;
			
			class B {}
			class C {}
		'''.parse
		val second = '''
			package apackage;
			
			class D {
			  C c;
			}
		'''.parse(first.eResource.resourceSet)
		'''
			package anotherpackage;
			
			class E {}
		'''.parse(first.eResource.resourceSet)
		second.classes.head => [
			assertScope(SmallJavaPackage.eINSTANCE.SJMember_Type, "D, B, C, apackage.D, apackage.B, apackage.C, anotherpackage.E")
		]
	}

	@Test def void testLocalClassHasThePrecedenceOverTheSameClassInTheSamePackageInDifferentFiles() {
		val first = '''
			package apackage;
			
			class B {}
			class C {}
		'''.parse
		val second = '''
			package apackage;
			
			class C {
			  C c;
			}
		'''.parse(first.eResource.resourceSet)
		second.classes.head => [
			assertScope(SmallJavaPackage.eINSTANCE.SJMember_Type, "C, B, apackage.C, apackage.B")
			assertSame(fields.head.type)
		]
	}

	def private returnExpSel(SJMethod m) {
		m.returnStatement.expression as SJMemberSelection
	}

	def private assertScope(EObject context, EReference reference, CharSequence expected) {
		expected.toString.assertEquals(context.getScope(reference).allElements.map[name].join(", "))
	}
}
