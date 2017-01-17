package org.example.school.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.xbase.junit.ui.AbstractContentAssistTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(SchoolUiInjectorProvider)
class SchoolContentAssistTest extends AbstractContentAssistTest {

	@Test
	def void testEmptyProgram() {
		newBuilder.assertProposal("school")
	}

	@Test
	def void testTeacherProposal() {
		newBuilder.append(
			'''
				school "A school" {
					teacher "A teacher"
					student "A student" registrationNum 100 {
						'''
		).assertProposal('"A teacher"')
	}

}
