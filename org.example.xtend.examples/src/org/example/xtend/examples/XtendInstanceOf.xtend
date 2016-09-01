package org.example.xtend.examples

import org.example.entities.entities.AttributeType
import org.example.entities.entities.BasicType
import org.example.entities.entities.EntityType

class XtendInstanceOf {
	def toString(AttributeType attributeType) {
		val elementType = attributeType.elementType
		if (elementType instanceof BasicType)
			elementType.typeName // elementType is a BasicType here
		else if (elementType instanceof EntityType)
			elementType.entity.name // elementType is an EntityType here 
	}
}
