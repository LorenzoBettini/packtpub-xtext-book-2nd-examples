package org.example.xbase.expressions.typesystem

import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputationState
import org.eclipse.xtext.xbase.typesystem.computation.XbaseTypeComputer
import org.example.xbase.expressions.expressions.EvalExpression

class ExpressionsTypeComputer extends XbaseTypeComputer {

	def dispatch void computeTypes(EvalExpression eval, ITypeComputationState state) {
		state.withNonVoidExpectation.computeTypes(eval.expression)
		state.acceptActualType(getRawTypeForName(String, state));
	}

}
