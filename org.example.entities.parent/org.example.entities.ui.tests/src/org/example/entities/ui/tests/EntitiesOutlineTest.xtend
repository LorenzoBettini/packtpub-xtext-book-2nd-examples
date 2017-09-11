package org.example.entities.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.testing.AbstractOutlineTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(EntitiesUiInjectorProvider)
class EntitiesOutlineTest extends AbstractOutlineTest {

	override protected getEditorId() {
		"org.example.entities.Entities"
	}

	@Test
	def void testOutline() {
		'''
		entity E1 {
			string s;
			int i;
		}
		
		entity E2 {}
		'''.assertAllLabels(
		'''
		E1
		  s : string
		  i : int
		E2
		'''
		)
	}
}
