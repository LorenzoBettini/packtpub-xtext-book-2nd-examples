package org.example.entities.standalone.tests;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import entities.MyDerivedEntity;

/**
 * @author Lorenzo Bettini
 *
 */
public class GeneratedEntitiesTest {

	@Test
	public void testGeneratedEntityJavaClass() {
		MyDerivedEntity e = new MyDerivedEntity();
		e.setStringAttr("test");
		assertEquals("test", e.getStringAttr());
	}

}
