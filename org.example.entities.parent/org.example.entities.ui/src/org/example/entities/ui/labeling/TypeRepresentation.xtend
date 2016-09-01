package org.example.entities.ui.labeling

import org.example.entities.entities.AttributeType
import org.example.entities.entities.BasicType
import org.example.entities.entities.EntityType

class TypeRepresentation {
	def representation(AttributeType t) {
		val elementType = t.elementType
		val elementTypeRepr = 
			switch (elementType) {
				BasicType : elementType.typeName
				EntityType : elementType?.entity.name
			}
		elementTypeRepr + if (t.array) "[]" else ""
	}
}