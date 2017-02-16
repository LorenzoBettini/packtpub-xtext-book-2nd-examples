package org.example.xbase.entities.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.xbase.junit.ui.AbstractContentAssistTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(EntitiesUiInjectorProvider)
class XbaseEntitiesContentAssistTest extends AbstractContentAssistTest {

	@Test
	def void testEmptyProgram() {
		newBuilder.assertProposal("entity")
	}

}
