package org.example.xtend.examples

import org.example.entities.entities.AttributeType
import org.example.entities.entities.BasicType
import org.example.entities.entities.EntityType
import org.example.entities.entities.Entity

class XtendSwitch {
	def toString(AttributeType attributeType) {
		val elementType = attributeType.elementType
		switch elementType {
			BasicType: // elementType is a BasicType here 
				elementType.typeName
			EntityType: // elementType is an EntityType here 
				elementType.entity.name
		}
	}

	def switchExample(Entity e, Entity specialEntity) {
		switch e {
			case e.name.length > 0: "has a name"
			case e.superType !== null: "has a super type"
			case specialEntity: "special entity"
			default: ""
		}
	}
}
