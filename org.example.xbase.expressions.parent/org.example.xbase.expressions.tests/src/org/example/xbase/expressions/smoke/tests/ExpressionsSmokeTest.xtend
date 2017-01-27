package org.example.xbase.expressions.smoke.tests

import org.eclipse.xtext.testing.smoketest.ProcessedBy
import org.eclipse.xtext.testing.smoketest.XtextSmokeTestRunner
import org.eclipse.xtext.xbase.testing.typesystem.TypeSystemSmokeTester
import org.example.xbase.expressions.tests.ExpressionsCompilerTest
import org.example.xbase.expressions.tests.ExpressionsParsingTest
import org.example.xbase.expressions.tests.ExpressionsTypeComputerTest
import org.example.xbase.expressions.tests.ExpressionsValidatorTest
import org.junit.runner.RunWith
import org.junit.runners.Suite.SuiteClasses

@RunWith(XtextSmokeTestRunner)
@ProcessedBy(
	value=TypeSystemSmokeTester,
	processInParallel=true
)
@SuiteClasses(
	ExpressionsParsingTest,ExpressionsCompilerTest,
	ExpressionsTypeComputerTest, ExpressionsValidatorTest
)
class ExpressionsSmokeTest {
	
}