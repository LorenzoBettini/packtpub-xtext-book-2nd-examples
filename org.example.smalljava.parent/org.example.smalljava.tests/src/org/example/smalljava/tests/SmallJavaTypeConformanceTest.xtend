package org.example.smalljava.tests

import com.google.inject.Inject
import com.google.inject.Provider
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.xtext.naming.IQualifiedNameProvider
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.example.smalljava.SmallJavaLib
import org.example.smalljava.smallJava.SJProgram
import org.example.smalljava.typing.SmallJavaTypeConformance
import org.junit.Test
import org.junit.runner.RunWith

import static org.example.smalljava.SmallJavaLib.*
import static org.example.smalljava.typing.SmallJavaTypeComputer.*

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaInjectorProvider)
class SmallJavaTypeConformanceTest {
	@Inject extension ParseHelper<SJProgram>
	@Inject extension SmallJavaTypeConformance
	@Inject extension SmallJavaLib
	@Inject extension IQualifiedNameProvider
	@Inject Provider<ResourceSet> rsp

	@Test def void testClassConformance() {
		'''
			class A {}
			class B extends A {}
			class C {}
			class D extends B {}
		'''.parse.classes => [
			// A subclass of A
			get(0).isConformant(get(0)).assertTrue
			// B subclass of A
			get(1).isConformant(get(0)).assertTrue
			// C not subclass of A
			get(2).isConformant(get(0)).assertFalse
			// D subclass of A
			get(3).isConformant(get(0)).assertTrue
			// null's type is conformant to any type
			NULL_TYPE.isConformant(get(0)).assertTrue
		]
	}

	@Test def void testStringConformance() {
		STRING_TYPE.isConformant(LIB_STRING.libClass).assertTrue
	}

	@Test def void testIntConformance() {
		INT_TYPE.isConformant(LIB_INTEGER.libClass).assertTrue
	}

	@Test def void testBoolConformance() {
		BOOLEAN_TYPE.isConformant(LIB_BOOLEAN.libClass).assertTrue
	}

	def private libClass(String fqn) {
		val rs = rsp.get
		loadLib(rs)
		(rs.resources.head.contents.head as SJProgram).classes.
			findFirst[fullyQualifiedName.toString == fqn]
	}

}
