package org.example.entities.validation

import org.eclipse.xtext.validation.Check
import org.example.entities.entities.Attribute
import org.example.entities.entities.EntitiesPackage
import org.example.entities.entities.Entity

import static extension java.lang.Character.*

class EntitiesValidator extends AbstractEntitiesValidator {

	protected static val ISSUE_CODE_PREFIX = "org.example.entities.";

	public static val HIERARCHY_CYCLE = ISSUE_CODE_PREFIX + "HierarchyCycle";

	public static val INVALID_ENTITY_NAME = ISSUE_CODE_PREFIX + "InvalidEntityName";

	public static val INVALID_ATTRIBUTE_NAME = ISSUE_CODE_PREFIX + "InvalidAttributeName";

	@Check
	def checkNoCycleInEntityHierarchy(Entity entity) {
		if (entity.superType == null)
			return // nothing to check
		val visitedEntities = newHashSet(entity)
		var current = entity.superType
		while (current != null) {
			if (visitedEntities.contains(current)) {
				error("cycle in hierarchy of entity '" + current.name + "'",
					EntitiesPackage.eINSTANCE.entity_SuperType,
					HIERARCHY_CYCLE,
					current.superType.name)
				return
			}
			visitedEntities.add(current)
			current = current.superType
		}
	}

	@Check
	def checkEntityNameStartsWithCapital(Entity entity) {
		if (entity.name.charAt(0).lowerCase)
			warning("Entity name should start with a capital",
				EntitiesPackage.eINSTANCE.entity_Name,
				INVALID_ENTITY_NAME,
				entity.name)
	}

	@Check
	def checkAttributeNameStartsWithLowercase(Attribute attr) {
		if (attr.name.charAt(0).upperCase)
			warning("Attribute name should start with a lowercase",
				EntitiesPackage.eINSTANCE.attribute_Name,
				INVALID_ATTRIBUTE_NAME,
				attr.name)
	}
}
