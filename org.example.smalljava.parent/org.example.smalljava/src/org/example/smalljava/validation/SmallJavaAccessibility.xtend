package org.example.smalljava.validation

import com.google.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.example.smalljava.smallJava.SJAccessLevel
import org.example.smalljava.smallJava.SJClass
import org.example.smalljava.smallJava.SJMember
import org.example.smalljava.typing.SmallJavaTypeConformance

import static extension org.eclipse.xtext.EcoreUtil2.*

class SmallJavaAccessibility {

	@Inject extension SmallJavaTypeConformance

	def isAccessibleFrom(SJMember member, EObject context) {
		val contextClass = context.getContainerOfType(SJClass)
		val memberClass = member.getContainerOfType(SJClass)
		switch (contextClass) {
			case contextClass === memberClass:
				true
			case contextClass.isSubclassOf(memberClass):
				member.access != SJAccessLevel.PRIVATE
			default:
				member.access == SJAccessLevel.PUBLIC
		}
	}
}
