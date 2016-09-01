package org.example.entities.tests

import org.junit.Test
import org.example.entities.entities.EntitiesFactory
import static extension org.junit.Assert.*
import org.example.entities.EntitiesModelUtil

class EntitiesModelUtilTest {
	val factory = EntitiesFactory::eINSTANCE

	@Test
	def void testAddEntityAfter() {
		val e1 = factory.createEntity => [
			name = "First"
		]
		val e2 = factory.createEntity => [
			name = "Second"
		]
		val model = factory.createModel => [
			entities += e1
			entities += e2
		]

		EntitiesModelUtil.addEntityAfter(e1, "Added").assertNotNull
		3.assertEquals(model.entities.size)
		"First".assertEquals(model.entities.get(0).name)
		"Added".assertEquals(model.entities.get(1).name)
		"Second".assertEquals(model.entities.get(2).name)
	}
}
