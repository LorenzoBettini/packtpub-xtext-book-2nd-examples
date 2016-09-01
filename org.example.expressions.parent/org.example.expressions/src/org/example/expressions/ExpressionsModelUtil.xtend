package org.example.expressions

import org.example.expressions.expressions.AbstractElement
import org.example.expressions.expressions.Expression
import org.example.expressions.expressions.ExpressionsModel
import org.example.expressions.expressions.Variable

import static extension org.eclipse.xtext.EcoreUtil2.*
import org.example.expressions.expressions.VariableRef
import com.google.inject.Inject
import org.eclipse.xtext.util.IResourceScopeCache

class ExpressionsModelUtil {

	@Inject IResourceScopeCache cache

	def isVariableDefinedBefore(VariableRef varRef) {
		varRef.variablesDefinedBefore.contains(varRef.variable)
	}

	def variablesDefinedBefore(Expression e) {
		e.getContainerOfType(AbstractElement).variablesDefinedBefore
	}

	def variablesDefinedBefore(AbstractElement containingElement) {
		cache.get(containingElement, containingElement.eResource) [
			val allElements = (containingElement.eContainer as ExpressionsModel).elements

			allElements.subList(0,
				allElements.indexOf(containingElement)
			).typeSelect(Variable).toSet
		]
	}
}
