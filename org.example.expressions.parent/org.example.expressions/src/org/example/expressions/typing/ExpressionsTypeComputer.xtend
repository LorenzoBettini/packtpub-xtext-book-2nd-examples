package org.example.expressions.typing

import com.google.inject.Inject
import org.eclipse.xtext.util.IResourceScopeCache
import org.example.expressions.ExpressionsModelUtil
import org.example.expressions.expressions.And
import org.example.expressions.expressions.BoolConstant
import org.example.expressions.expressions.Comparison
import org.example.expressions.expressions.Equality
import org.example.expressions.expressions.Expression
import org.example.expressions.expressions.IntConstant
import org.example.expressions.expressions.Minus
import org.example.expressions.expressions.MulOrDiv
import org.example.expressions.expressions.Not
import org.example.expressions.expressions.Or
import org.example.expressions.expressions.Plus
import org.example.expressions.expressions.StringConstant
import org.example.expressions.expressions.VariableRef

class ExpressionsTypeComputer {
	public static val STRING_TYPE = new StringType
	public static val INT_TYPE = new IntType
	public static val BOOL_TYPE = new BoolType

	@Inject extension ExpressionsModelUtil

	@Inject IResourceScopeCache cache

	def isStringType(ExpressionsType type) {
		type === STRING_TYPE
	}

	def isIntType(ExpressionsType type) {
		type === INT_TYPE
	}

	def isBoolType(ExpressionsType type) {
		type === BOOL_TYPE
	}

	def dispatch ExpressionsType typeFor(Expression e) {
		switch (e) {
			StringConstant: STRING_TYPE
			IntConstant: INT_TYPE
			BoolConstant: BOOL_TYPE
			Not: BOOL_TYPE
			MulOrDiv: INT_TYPE
			Minus: INT_TYPE
			Comparison: BOOL_TYPE
			Equality: BOOL_TYPE
			And: BOOL_TYPE
			Or: BOOL_TYPE
		}
	}

	def dispatch ExpressionsType typeFor(Plus e) {
		val leftType = e.left.typeFor
		val rightType = e.right?.typeFor
		if (leftType.isStringType || rightType.isStringType)
			STRING_TYPE
		else
			INT_TYPE
	}

	def dispatch ExpressionsType typeFor(VariableRef varRef) {
		if (!varRef.isVariableDefinedBefore)
			return null
		else {
			val variable = varRef.variable
			// use a pair as the key, not to conflict with the
			// use of cache we make in ExpressionsModelUtil
			return cache.get("type" -> variable, variable.eResource) [
				variable.expression.typeFor
			]
		}
	}
}
