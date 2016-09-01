package org.example.hellomaven.ui.tests

import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.xbase.junit.ui.AbstractContentAssistTest
import org.junit.Test
import org.junit.runner.RunWith
import org.example.hellomaven.ui.tests.HelloMavenUiInjectorProvider

@RunWith(XtextRunner)
@InjectWith(HelloMavenUiInjectorProvider)
class HelloMavenContentAssistTest extends AbstractContentAssistTest {

	@Test
	def void testEmptyProgram() {
		newBuilder.assertProposal("Hello")
	}

}
