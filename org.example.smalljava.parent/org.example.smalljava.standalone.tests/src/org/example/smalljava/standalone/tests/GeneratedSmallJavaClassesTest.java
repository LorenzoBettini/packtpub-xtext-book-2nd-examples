package org.example.smalljava.standalone.tests;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import smalljava.examples.SmallJavaExample;

/**
 * @author Lorenzo Bettini
 *
 */
public class GeneratedSmallJavaClassesTest {

	SmallJavaExample e;

	@Before
	public void init() {
		e = new SmallJavaExample();
	}

	@Test
	public void testGeneratedSmallJavaClass() {
		assertEquals("class smalljava.examples.SmallJavaExample", e.m().getClass().toString());
	}

	@Test
	public void testGeneratedSmallJavaClassMethod1() {
		assertEquals("Hallo", e.sayHello1());
	}

	@Test
	public void testGeneratedSmallJavaClassMethod2() {
		assertEquals("Hello", e.sayHello2());
	}

}
