package org.example.entities

import org.example.entities.entities.Entity
import org.example.entities.entities.Model
import org.example.entities.entities.EntitiesFactory

class EntitiesModelUtil {
	def static addEntityAfter(Entity entity, String nameOfEntityToAdd) {
		val model = entity.eContainer as Model
		EntitiesFactory.eINSTANCE.createEntity() => [
			name = nameOfEntityToAdd
			model.entities.add(model.entities.indexOf(entity) + 1, it)
		]
	}
}
