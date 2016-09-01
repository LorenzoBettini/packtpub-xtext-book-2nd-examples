package org.example.smalljava.ui.tests

import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.ui.AbstractOutlineTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(SmallJavaUiInjectorProvider)
class SmallJavaOutlineTest extends AbstractOutlineTest {

	override protected getEditorId() {
		"org.example.smalljava.SmallJava"
	}

	@Test
	def void testOutline() {
		'''
		class A {}
		class B {}
		
		class C {
			A f;
			A g;
			C n(A a, B b) { return null; }
			C m(C c) { return null; }
		}
		'''.assertAllLabels(
		'''
		A
		B
		C
		  f : A
		  g : A
		  n(A, B) : C
		  m(C) : C
		'''
		)
	}
}
