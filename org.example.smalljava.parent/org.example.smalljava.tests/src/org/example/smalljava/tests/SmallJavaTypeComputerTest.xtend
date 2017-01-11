package org.example.smalljava.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.example.smalljava.SmallJavaModelUtil
import org.example.smalljava.smallJava.SJAssignment
import org.example.smalljava.smallJava.SJExpression
import org.example.smalljava.smallJava.SJIfStatement
import org.example.smalljava.smallJava.SJMemberSelection
import org.example.smalljava.smallJava.SJProgram
import org.example.smalljava.smallJava.SJReturn
import org.example.smalljava.smallJava.SJStatement
import org.example.smalljava.smallJava.SJVariableDeclaration
import org.example.smalljava.typing.SmallJavaTypeComputer
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaInjectorProvider)
class SmallJavaTypeComputerTest {
	@Inject extension ParseHelper<SJProgram>
	@Inject extension SmallJavaTypeComputer
	@Inject extension SmallJavaModelUtil

	@Test def void thisType() {
		"this".assertType("C")
	}

	@Test def void paramRefType() {
		"p".assertType("P")
	}

	@Test def void varRefType() {
		"v".assertType("V")
	}

	@Test def void newType() {
		"new N()".assertType("N")
	}

	@Test def void fieldSelectionType() {
		"this.f".assertType("F")
	}

	@Test def void methodInvocationType() {
		"this.m(new P())".assertType("R")
	}

	@Test def void assignmentType() {
		"v = new P()".assertType("V")
	}

	@Test def void stringConstantType() {
		'"foo"'.assertType("stringType")
	}

	@Test def void intConstantType() {
		'10'.assertType("intType")
	}

	@Test def void boolConstantType() {
		'true'.assertType("booleanType")
	}

	@Test def void nullType() {
		'null'.assertType("nullType")
	}

	@Test def void testTypeForUnresolvedReferences() {
		'''
		class C {
			U m() {
				f ; // unresolved symbol
				this.n(); // unresolved method 
				this.f; // unresolved field
				return null;
			}
		}
		'''.parse => [
			classes.head.methods.head.body.statements => [
				get(0).statementExpressionType.assertNull
				get(1).statementExpressionType.assertNull
				get(2).statementExpressionType.assertNull
			]
		]
	}

	@Test def void testIsPrimitiveType() {
		'''
		class C {
			C m() {
				return true;
			}
		}
		'''.parse.classes.head => [
			it.isPrimitive.assertFalse
			methods.head.returnStatement.expression.typeFor.isPrimitive.assertTrue
		]
	}

	@Test def void testVarDeclExpectedType() {
		('''V v = null;'''.testStatements.head as SJVariableDeclaration).
			expression.assertExpectedType("V")
	}

	@Test def void testAssignmentRightExpectedType() {
		('''this.f = null;'''.testStatements.head as SJAssignment).
			right.assertExpectedType("F")
	}

	@Test def void testAssignmentLeftExpectedType() {
		('''this.f = null;'''.testStatements.head as SJAssignment).
			left.expectedType.assertNull
	}

	@Test def void testReturnExpectedType() {
		("".testStatements.last as SJReturn).
			expression.assertExpectedType("R")
	}

	@Test def void testIfExpressionExpectedType() {
		("if (e) {}".testStatements.head as SJIfStatement).
			expression.assertExpectedType("booleanType")
	}

	@Test def void testMethodInvocationArgsExpectedType() {
		("this.m(new P1(), new P2());".testStatements.head as SJMemberSelection).
			args => [
				get(0).assertExpectedType("P1")
				get(1).assertExpectedType("P2")
			]
	}

	@Test def void testMethodInvocationReceiverExpectedType() {
		("this.m();".testStatements.head as SJMemberSelection).
			receiver.expectedType.assertNull
	}

	@Test def void testStandaloneMemberSelectionExpectedType() {
		// a standalone method invocation has no expected type
		'''
		class A {
			A a;
			A m() { this.a; this.m(); return null; }
		}
		'''.parse => [
			classes.head.methods.head.body.statements => [
				(get(0) as SJExpression).expectedType.assertNull;
				(get(1) as SJExpression).expectedType.assertNull
			]
		]
	}

	@Test def void testWrongMethodInvocationArgsExpectedType() {
		// method n does not exist
		("this.n(new P1(), new P2());".testStatements.head as SJMemberSelection).
			args => [
				get(0).expectedType.assertNull
				get(1).expectedType.assertNull
			]
		
		// too many arguments
		("this.m(new P1(), new P2(), new P1());".testStatements.head as SJMemberSelection).
			args.get(2).expectedType.assertNull
	}

	def private assertType(CharSequence testExp, String expectedClassName) {
		'''
			class R { }
			class P { }
			class V { }
			class N { }
			class F { }
			
			class C {
			  F f;
			  
			  R m(P p) {
			    V v = null;
			    «testExp»;
			    return null;
			  }
			}
		'''.parse => [
			expectedClassName.assertEquals(
				classes.last.methods.last.body.statements.get(1).statementExpressionType.name
			)
		]
	}

	def private statementExpressionType(SJStatement s) {
		(s as SJExpression).typeFor
	}

	def private testStatements(CharSequence statement) {
		'''
		class R {  }
		class P1 {  }
		class P2 {  }
		class V {  }
		class F {  }
		
		class C {
			F f;
			R m(P1 p1, P2 p2) {
				«statement»
				return null;
			}
		}
		'''.parse.classes.last.methods.last.body.statements
	}

	def private assertExpectedType(SJExpression exp, String expectedClassName) {
		expectedClassName.assertEquals(exp.expectedType.name)
	}


}
