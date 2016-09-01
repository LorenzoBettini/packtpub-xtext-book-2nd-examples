package org.example.expressions.performance.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.example.expressions.expressions.ExpressionsModel

abstract class AbstractExpressionsPerformanceTest {
	@Inject extension ParseHelper<ExpressionsModel>
	@Inject extension ValidationTestHelper

	def protected testPerformance(int n) {
		/*
		 * var i_0 = 0
		 * var i_1 = i_0
		 * var i_2 = i_0 + i_1
		 * var i_3 = i_0 + i_1 + i_2
		 * etc..
		 */
		'''
			var i_0 = 0
			var i_1 = i_0
			«FOR i : 2..n»
			var i_«i» = i_0«FOR j : 1..i-1» + i_«j»«ENDFOR»
			«ENDFOR»
		'''.parse.assertNoErrors
	}
}
