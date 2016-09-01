package org.example.expressions.interpreter

import com.google.inject.Inject
import org.eclipse.xtext.util.IResourceScopeCache
import org.example.expressions.expressions.AbstractElement
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
import org.example.expressions.typing.ExpressionsTypeComputer

class ExpressionsInterpreter {

	@Inject extension ExpressionsTypeComputer
	@Inject IResourceScopeCache cache

	def dispatch Object interpret(Expression e) {
		switch (e) {
			IntConstant:
				e.value
			BoolConstant:
				Boolean.parseBoolean(e.value)
			StringConstant:
				e.value
			Not:
				!(e.expression.interpret as Boolean)
			MulOrDiv: {
				val left = e.left.interpret as Integer
				val right = e.right.interpret as Integer
				if (e.op == '*')
					left * right
				else
					left / right
			}
			Minus:
				(e.left.interpret as Integer) - (e.right.interpret as Integer)
			Plus: {
				if (e.left.typeFor.isStringType || e.right.typeFor.isStringType)
					e.left.interpret.toString + e.right.interpret.toString
				else
					(e.left.interpret as Integer) + (e.right.interpret as Integer)
			}
			Equality: {
				if (e.op == '==')
					e.left.interpret == e.right.interpret
				else
					e.left.interpret != e.right.interpret
			}
			And: {
				(e.left.interpret as Boolean) && (e.right.interpret as Boolean)
			}
			Or: {
				(e.left.interpret as Boolean) || (e.right.interpret as Boolean)
			}
			Comparison: {
				if (e.left.typeFor.isStringType) {
					val left = e.left.interpret as String
					val right = e.right.interpret as String
					switch (e.op) {
						case '<': left < right
						case '>': left > right
						case '>=': left >= right
						case '<=': left <= right
						default: false
					}
				} else {
					val left = e.left.interpret as Integer
					val right = e.right.interpret as Integer
					switch (e.op) {
						case '<': left < right
						case '>': left > right
						case '>=': left >= right
						case '<=': left <= right
						default: false
					}
				}
			}
			VariableRef: {
				// avoid interpreting the same variable over and over again
				val v = e.variable
				cache.get("interpret" -> v, e.eResource) [
					v.interpret
				]
			}
		}
	}

	def dispatch Object interpret(AbstractElement e) {
		e.expression.interpret
	}
}
