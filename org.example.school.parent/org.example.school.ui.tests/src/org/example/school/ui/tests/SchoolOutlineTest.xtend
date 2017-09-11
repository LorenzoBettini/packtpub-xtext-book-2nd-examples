package org.example.school.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.testing.AbstractOutlineTest
import org.example.school.ui.internal.SchoolActivator
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(SchoolUiInjectorProvider)
class SchoolOutlineTest extends AbstractOutlineTest {
	
	override protected getEditorId() {
		SchoolActivator.ORG_EXAMPLE_SCHOOL_SCHOOL
	}

	@Test def void testOutline() {
		'''
		school "A school" {
			student "A student" registrationNum 100
			student "Another student" registrationNum 100
			teacher "A teacher"
		}
		'''.assertAllLabels(
			'''
			test
			  School A school
			    teachers 1, students 2
			    Student A student
			    Student Another student
			    Teacher A teacher
			'''
		)
	}
}
