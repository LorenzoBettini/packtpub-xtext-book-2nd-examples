package org.example.entities.ui.tests

import org.eclipse.xtext.resource.XtextResource
import org.eclipse.xtext.ui.XtextProjectHelper
import org.eclipse.xtext.ui.testing.AbstractEditorTest
import org.eclipse.xtext.util.CancelIndicator
import org.eclipse.xtext.util.concurrent.CancelableUnitOfWork
import org.example.entities.EntitiesModelUtil
import org.example.entities.entities.EntitiesFactory
import org.example.entities.entities.Model
import org.junit.Before
import org.junit.Test

import static extension org.eclipse.xtext.ui.testing.util.IResourcesSetupUtil.*
import static extension org.eclipse.xtext.ui.testing.util.JavaProjectSetupUtil.*

class EntitiesEditorTest extends AbstractEditorTest {
	val TEST_PROJECT = "mytestproject"

	override protected getEditorId() {
		"org.example.entities.Entities"
	}

	@Before
	override void setUp() {
		super.setUp
		createJavaProjectWithXtextNature
	}

	@Test
	def void testEntitiesEditor() {
		createTestFile("entity E {}").openEditor
	}

	@Test
	def void testEntitiesEditorContents() {
		"entity E {}".assertEquals(
			createTestFile("entity E {}").openEditor.document.get
		)
	}

	@Test
	def void testEntitiesEditorContentsAsModel() {
		"E".assertEquals(
			createTestFile("entity E {}").openEditor.document.readOnly [
				// 'it' is an XtextResource
				contents.get(0) as Model
			].entities.get(0).name
		)
	}

	@Test
	def void testChangeContents() {
		val editor = createTestFile("entity E {}").openEditor

		editor.document.modify [
			val model = (contents.get(0) as Model)
			val currentEntity = model.entities.get(0)
			model.entities += EntitiesFactory.eINSTANCE.createEntity => [
				name = "Added"
				superType = currentEntity
			]
		]
		'''
		entity E {}
		
		entity Added extends E {
		}
		'''.toString.assertEquals(editor.document.get)
	}

	@Test
	def void testChangeContentsWithCancelable() {
		val editor = createTestFile("entity E {}").openEditor

		val unitOfWork = new CancelableUnitOfWork<Boolean,XtextResource>() {
			override exec(XtextResource it, CancelIndicator cancelIndicator) throws Exception {
				if (cancelIndicator.isCanceled)
					return false
				val model = (contents.get(0) as Model)
				val currentEntity = model.entities.get(0)
				model.entities += EntitiesFactory.eINSTANCE.createEntity => [
					name = "Added"
					superType = currentEntity
				]
			}
		}
		// simulate cancel
		unitOfWork.cancelIndicator = [true]
		editor.document.modify(unitOfWork)
		// since the unit of work has been canceled, there should be no change in the model
		"entity E {}".toString.assertEquals(editor.document.get)
		// simulate cancel false
		unitOfWork.cancelIndicator = [false]
		editor.document.modify(unitOfWork)
		// now there should be no change in the model
		'''
		entity E {}
		
		entity Added extends E {
		}
		'''.toString.assertEquals(editor.document.get)
	}

	@Test
	def void testAddEntity() {
		val editor = createTestFile(
  		'''
		entity E1 {}
		
		entity E2 {}
		''').openEditor

		editor.document.modify [
			EntitiesModelUtil.addEntityAfter(
				(contents.get(0) as Model).entities.get(0),
				"Added"
			)
		]
		'''
		entity E1 {}
		
		entity Added {
		}
		
		entity E2 {}
		'''.toString.assertEquals(editor.document.get)
	}

	def void createJavaProjectWithXtextNature() {
		createJavaProject(TEST_PROJECT) => [
			getProject().addNature(XtextProjectHelper.NATURE_ID)
			addSourceFolder("entities-gen")
		]
	}

	def createTestFile(String contents) {
		createFile(TEST_PROJECT + "/src/test.entities", contents)
	}
}
