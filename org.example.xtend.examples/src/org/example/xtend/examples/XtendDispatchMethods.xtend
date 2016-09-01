package org.example.xtend.examples

import org.example.entities.entities.AttributeType
import org.example.entities.entities.BasicType
import org.example.entities.entities.EntityType

class XtendDispatchMethods {
	def toString(AttributeType attributeType) {
		attributeType.elementType.typeToString
	}
	
	def dispatch typeToString(BasicType type) {
		type.typeName
	}
	
	def dispatch typeToString(EntityType type) {
		type.entity.name
	}
}