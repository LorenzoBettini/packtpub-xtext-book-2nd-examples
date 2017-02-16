package org.example.smalljava

import com.google.inject.Inject
import org.example.smalljava.smallJava.SJBlock
import org.example.smalljava.smallJava.SJClass
import org.example.smalljava.smallJava.SJField
import org.example.smalljava.smallJava.SJMember
import org.example.smalljava.smallJava.SJMethod
import org.example.smalljava.smallJava.SJReturn

class SmallJavaModelUtil {

	@Inject extension SmallJavaLib

	def fields(SJClass c) {
		c.members.filter(SJField)
	}

	def methods(SJClass c) {
		c.members.filter(SJMethod)
	}

	def returnStatement(SJMethod m) {
		m.body.returnStatement
	}

	def returnStatement(SJBlock block) {
		block.statements.filter(SJReturn).head
	}

	def classHierarchy(SJClass c) {
		val visited = newLinkedHashSet()

		var current = c.superclass
		while (current !== null && !visited.contains(current)) {
			visited.add(current)
			current = current.superclass
		}

		val object = c.getSmallJavaObjectClass
		if (object !== null)
			visited.add(object)

		visited
	}

	def classHierarchyMethods(SJClass c) {
		// reverse the list so that methods in subclasses
		// will be added later to the map, thus overriding
		// the one already present in the superclasses
		// if the methods have the same name
		c.classHierarchy.toList.reverseView.
			map[methods].flatten.toMap[name]
	}

	def classHierarchyMembers(SJClass c) {
		c.classHierarchy.map[members].flatten
	}

	def memberAsString(SJMember m) {
		m.name +
		if (m instanceof SJMethod)
			"(" + m.params.map[type.name].join(", ") + ")"
		else ""
	}

	def memberAsStringWithType(SJMember m) {
		m.memberAsString + " : " + m.type.name
	}
}
