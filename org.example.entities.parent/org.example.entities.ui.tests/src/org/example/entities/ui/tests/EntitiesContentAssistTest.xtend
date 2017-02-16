package org.example.entities.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.xbase.junit.ui.AbstractContentAssistTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(EntitiesUiInjectorProvider)
class EntitiesContentAssistTest extends AbstractContentAssistTest {
	@Test
	def void testEmptyProgram() {
		newBuilder.assertText("entity")
	}

	@Test
	def void testSuperEntity() {
		newBuilder.append("entity E extends ").assertText("E")
	}

	@Test
	def void testSuperEntity2() {
		newBuilder.append("entity A{} entity E extends ").assertText("A", "E")
	}

	@Test
	def void testAttributeTypes() {
		newBuilder.append("entity E { ").assertText("E", "boolean", "int", "string", "}")
	}
}
