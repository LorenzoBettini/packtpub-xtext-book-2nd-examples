package org.example.school.resource

import org.eclipse.xtext.resource.IDerivedStateComputer
import org.eclipse.xtext.resource.DerivedStateAwareResource
import org.example.school.school.School
import org.example.school.school.SchoolFactory

class SchoolDerivedStateComputer implements IDerivedStateComputer {

	override discardDerivedState(DerivedStateAwareResource resource) {
		resource.allContents.filter(School).forEach [
			statistics = null
		]
	}

	override installDerivedState(DerivedStateAwareResource resource, boolean preLinkingPhase) {
		if (!preLinkingPhase)
			resource.allContents.filter(School).forEach [ school |
				school.statistics = SchoolFactory.eINSTANCE.createSchoolStatistics => [
					studentsNumber = school.students.size
					teachersNumber = school.teachers.size
					studentsWithNoTeacher = school.students.filter[teachers.empty]
				]
			]
	}

}
