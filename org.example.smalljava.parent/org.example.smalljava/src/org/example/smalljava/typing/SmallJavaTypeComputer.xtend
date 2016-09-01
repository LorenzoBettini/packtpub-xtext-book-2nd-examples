package org.example.smalljava.typing

import com.google.inject.Inject
import org.example.smalljava.SmallJavaLib
import org.example.smalljava.smallJava.SJAssignment
import org.example.smalljava.smallJava.SJBoolConstant
import org.example.smalljava.smallJava.SJClass
import org.example.smalljava.smallJava.SJExpression
import org.example.smalljava.smallJava.SJIntConstant
import org.example.smalljava.smallJava.SJMemberSelection
import org.example.smalljava.smallJava.SJMethod
import org.example.smalljava.smallJava.SJNew
import org.example.smalljava.smallJava.SJNull
import org.example.smalljava.smallJava.SJReturn
import org.example.smalljava.smallJava.SJStringConstant
import org.example.smalljava.smallJava.SJSuper
import org.example.smalljava.smallJava.SJSymbolRef
import org.example.smalljava.smallJava.SJThis
import org.example.smalljava.smallJava.SJVariableDeclaration
import org.example.smalljava.smallJava.SmallJavaFactory
import org.example.smalljava.smallJava.SmallJavaPackage

import static extension org.eclipse.xtext.EcoreUtil2.*

class SmallJavaTypeComputer {
	private static val factory = SmallJavaFactory.eINSTANCE
	public static val STRING_TYPE = factory.createSJClass => [name = 'stringType']
	public static val INT_TYPE = factory.createSJClass => [name = 'intType']
	public static val BOOLEAN_TYPE = factory.createSJClass => [name = 'booleanType']
	public static val NULL_TYPE = factory.createSJClass => [name = 'nullType']

	static val ep = SmallJavaPackage.eINSTANCE

	@Inject extension SmallJavaLib

	def SJClass typeFor(SJExpression e) {
		switch (e) {
			SJNew:
				e.type
			SJSymbolRef:
				e.symbol.type
			SJMemberSelection:
				e.member.type
			SJAssignment:
				e.left.typeFor
			SJThis:
				e.getContainerOfType(SJClass)
			SJSuper:
				e.getContainerOfType(SJClass).getSuperclassOrObject
			SJNull:
				NULL_TYPE
			SJStringConstant:
				STRING_TYPE
			SJIntConstant:
				INT_TYPE
			SJBoolConstant:
				BOOLEAN_TYPE
		}
	}

	def getSuperclassOrObject(SJClass c) {
		c.superclass ?: getSmallJavaObjectClass(c)
	}

	def isPrimitive(SJClass c) {
		c.eResource == null
	}

	def expectedType(SJExpression e) {
		val c = e.eContainer
		val f = e.eContainingFeature
		switch (c) {
			SJVariableDeclaration:
				c.type
			SJAssignment case f == ep.SJAssignment_Right:
				typeFor(c.left)
			SJReturn:
				c.getContainerOfType(SJMethod).type
			case f == ep.SJIfStatement_Expression:
				BOOLEAN_TYPE
			SJMemberSelection case f == ep.SJMemberSelection_Args: {
				// assume that it refers to a method and that there
				// is a parameter corresponding to the argument
				try {
					(c.member as SJMethod).params.get(c.args.indexOf(e)).type
				} catch (Throwable t) {
					null // otherwise there is no specific expected type
				}
			}
		}
	}
}
