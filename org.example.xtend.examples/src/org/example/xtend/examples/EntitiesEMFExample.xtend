package org.example.xtend.examples

import static org.example.entities.entities.EntitiesFactory.*

class EntitiesEMFExample {
	def static void main(String[] args) {
		val superEntity = eINSTANCE.createEntity
		superEntity.name = "MySuperEntity"

		eINSTANCE.createEntity => [
			name = "MyEntity"
			superType = superEntity
			attributes += eINSTANCE.createAttribute => [
				name = "myattribute"
				type = eINSTANCE.createAttributeType => [
					array = false
					length = 10
					elementType = eINSTANCE.createEntityType => [
						entity = superEntity
					]
				]
			]
		]
	}

}
