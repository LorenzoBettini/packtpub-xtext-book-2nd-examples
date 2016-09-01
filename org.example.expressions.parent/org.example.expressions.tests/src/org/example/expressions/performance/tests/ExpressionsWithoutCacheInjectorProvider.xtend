package org.example.expressions.performance.tests

import com.google.inject.Inject
import org.example.expressions.ExpressionsModelUtil
import org.example.expressions.ExpressionsRuntimeModule
import org.example.expressions.expressions.AbstractElement
import org.example.expressions.expressions.ExpressionsModel
import org.example.expressions.expressions.Variable
import org.example.expressions.expressions.VariableRef
import org.example.expressions.performance.tests.ExpressionsWithoutCacheInjectorProvider.ExpressionsModelUtilWithoutCache
import org.example.expressions.performance.tests.ExpressionsWithoutCacheInjectorProvider.ExpressionsTypeComputerWithoutCache
import org.example.expressions.tests.ExpressionsInjectorProvider
import org.example.expressions.typing.ExpressionsType
import org.example.expressions.typing.ExpressionsTypeComputer

import static extension org.eclipse.xtext.EcoreUtil2.*

/**
 * Injector provider for testing without cache.
 * 
 * @author Lorenzo Bettini
 */
class ExpressionsWithoutCacheInjectorProvider extends ExpressionsInjectorProvider {

	static class ExpressionsModelUtilWithoutCache extends ExpressionsModelUtil {

		override variablesDefinedBefore(AbstractElement containingElement) {
			val allElements = (containingElement.eContainer as ExpressionsModel).elements

			allElements.subList(
				0,
				allElements.indexOf(containingElement)
			).typeSelect(Variable).toSet
		}

	}

	static class ExpressionsTypeComputerWithoutCache extends ExpressionsTypeComputer {

		@Inject extension ExpressionsModelUtil

		override dispatch ExpressionsType typeFor(VariableRef varRef) {
			if (!varRef.isVariableDefinedBefore)
				return null
			else {
				varRef.variable.expression.typeFor
			}
		}
	}

	override protected createRuntimeModule() {
		new ExpressionsRuntimeModule() {
			def Class<? extends ExpressionsModelUtil> bindExpressionsModelUtil() {
				ExpressionsModelUtilWithoutCache
			}

			def Class<? extends ExpressionsTypeComputer> bindExpressionsTypeComputer() {
				ExpressionsTypeComputerWithoutCache
			}
		}
	}

}
