package org.example.expressions.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.TemporaryFolder
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ExpressionsInjectorProvider))
class ExpressionsGeneratorTest {

	@Rule
	@Inject public TemporaryFolder temporaryFolder

	@Inject extension CompilationTestHelper

	@Test def void testEvaluateExpressions() {
		'''
			var i = 0
			
			var j = (i >0 && 1 < (i+1))
			
			eval j || true
			
			eval (1 + 10) < (2 * (3 + 5))
			
			eval (1 + 10) < (2 / (3 * 2))
		'''.assertCompilesTo(
			'''
			var i = 0 ~> 0
			var j = (i >0 && 1 < (i+1)) ~> false
			eval j || true ~> true
			eval (1 + 10) < (2 * (3 + 5)) ~> true
			eval (1 + 10) < (2 / (3 * 2)) ~> false'''
		)
	}

}
