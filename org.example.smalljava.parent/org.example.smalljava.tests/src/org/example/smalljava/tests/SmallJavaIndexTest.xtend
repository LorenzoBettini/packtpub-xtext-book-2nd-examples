package org.example.smalljava.tests

import com.google.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.example.smalljava.scoping.SmallJavaIndex
import org.example.smalljava.smallJava.SJProgram
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaInjectorProvider)
class SmallJavaIndexTest {
	@Inject extension ParseHelper<SJProgram>
	@Inject extension SmallJavaIndex

	@Test def void testExportedEObjectDescriptions() {
		'''
			class C {
			  A f;
			  A m(A p) {
			    A v = null;
			    return null;
			  }
			}
			class A {}
		'''.parse.assertExportedEObjectDescriptions("C, C.f, C.m, C.m.p, A")
		// before SmallJavaResourceDescriptionsStrategy the output was
		// "C, C.f, C.m, C.m.p, C.m.v, A"
	}

	@Test def void testExportedEObjectDescriptionsWithPackage() {
		'''
			package my.pack;
			class C {}
		'''.parse.assertExportedEObjectDescriptions("my.pack, my.pack.C")
	}

	@Test def void testClassesInIndex() {
		val first = '''
		package my.first.pack;
		class C { }'''.parse

		'''
		package my.second.pack;
		class D { }
		'''.parse(first.eResource.resourceSet).
		classes.head.assertClassesInIndex("my.first.pack.C, my.second.pack.D")
	}

	@Test def void testVisibleExternalClassesInIndex() {
		val first = '''
		package my.first.pack;
		class C { }
		'''.parse

		val second = '''
		package my.second.pack;
		class D { }
		'''.parse(first.eResource.resourceSet)

		first.classes.head.
			assertExternalClassesInIndex("my.second.pack.D")
		second.classes.head.
			assertExternalClassesInIndex("my.first.pack.C")
		// also check that the original collections are not changed
		// after the difference
		second.classes.head.assertClassesInIndex("my.first.pack.C, my.second.pack.D")
	}

	@Test def void testVisibleExternalClassesContainDuplicatesFromExternalFiles() {
		val first = '''
		package my.first.pack;
		class C { }
		'''.parse

		val second = '''
		package my.first.pack;
		class C { }
		class D { }
		'''.parse(first.eResource.resourceSet)

		first.classes.head.
			assertExternalClassesInIndex("my.first.pack.C, my.first.pack.D")
		second.classes.head.
			assertExternalClassesInIndex("my.first.pack.C")
	}

	@Test def void testVisibleExternalClassesAppearOnlyOnce() {
		val first = '''
		package my.first.pack;
		class C { }
		class C { }
		'''.parse

		val second = '''
		package my.second.pack;
		class D { }
		class D { }
		'''.parse(first.eResource.resourceSet)

		first.classes.head.
			assertExternalClassesInIndex("my.second.pack.D")
		second.classes.head.
			assertExternalClassesInIndex("my.first.pack.C")
	}

	def private assertExportedEObjectDescriptions(EObject o, CharSequence expected) {
		expected.toString.assertEquals(
			o.getExportedEObjectDescriptions.map[qualifiedName].join(", ")
		)
	}

	def private assertClassesInIndex(EObject o, String expected) {
		val visibleClassesDescriptions = o.getVisibleClassesDescriptions
		expected.assertEquals(visibleClassesDescriptions.
			map[it.qualifiedName].join(", "))
	}

	def private assertExternalClassesInIndex(EObject o, String expected) {
		val visibleExternalClassesDescriptions = o.getVisibleExternalClassesDescriptions
		expected.assertEquals(visibleExternalClassesDescriptions.values.
			map[it.qualifiedName].join(", "))
	}

}
