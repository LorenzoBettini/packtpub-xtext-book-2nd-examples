package org.example.entities.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.example.entities.entities.EntitiesPackage
import org.example.entities.entities.Model
import org.example.entities.validation.EntitiesValidator
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(EntitiesInjectorProvider)
class EntitiesValidatorTest {

	@Inject extension ParseHelper<Model>
	@Inject extension ValidationTestHelper

	@Test
	def void testEntityExtendsItself() {
		'''
			entity MyEntity extends MyEntity {
			    
			}
		'''.parse.assertCycleInHierarchy("MyEntity")
	}

	@Test
	def void testCycleInEntityHierarchy() {
		'''
			entity A extends B {}
			entity B extends C {}
			entity C extends A {}
		'''.parse => [
			assertCycleInHierarchy("A")
			assertCycleInHierarchy("B")
			assertCycleInHierarchy("C")
		]
	}

	@Test
	def void testCycleInHierarchyErrorPosition() {
		val testInput =
		'''
			entity MyEntity extends MyEntity {
			    
			}
		'''
		testInput.parse.assertError(
			EntitiesPackage.eINSTANCE.entity,
			EntitiesValidator.HIERARCHY_CYCLE,
			testInput.lastIndexOf("MyEntity"), // offset
			"MyEntity".length // length
		)
	}

	@Test
	def void testValidHierarchy() {
		'''
			entity FirstEntity {}
			entity SecondEntity extends FirstEntity {}
		'''.parse.assertNoErrors
	}

	def private assertCycleInHierarchy(Model m, String entityName) {
		m.assertError(
			EntitiesPackage.eINSTANCE.entity,
			EntitiesValidator.HIERARCHY_CYCLE,
			"cycle in hierarchy of entity '" + entityName + "'"
		)
	}
}
