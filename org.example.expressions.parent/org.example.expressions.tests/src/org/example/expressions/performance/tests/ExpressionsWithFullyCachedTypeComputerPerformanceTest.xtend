package org.example.expressions.performance.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

@RunWith(XtextRunner)
@InjectWith(ExpressionsWithFullyCachedTypeComputerInjectorProvider)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
class ExpressionsWithFullyCachedTypeComputerPerformanceTest extends AbstractExpressionsPerformanceTest {
	/**
	 * Just to make sure that Xtext startup does not
	 * interfere with performance tests.
	 */
	@Test def aWarmUp() {
		testPerformance(10)
	}

	@Test def testPerformance10() {
		testPerformance(10)
	}

	@Test def testPerformance12() {
		testPerformance(12)
	}

	@Test def testPerformance14() {
		testPerformance(14)
	}

	@Test def testPerformance16() {
		testPerformance(16)
	}

	@Test def testPerformance18() {
		testPerformance(18)
	}

	@Test def testPerformance20() {
		testPerformance(20)
	}

	@Test def testPerformance50() {
		testPerformance(50)
	}

}
