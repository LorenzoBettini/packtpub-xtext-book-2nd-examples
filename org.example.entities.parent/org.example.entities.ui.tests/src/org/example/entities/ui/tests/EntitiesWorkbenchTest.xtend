package org.example.entities.ui.tests

import org.eclipse.core.resources.IResource
import org.eclipse.emf.ecore.EValidator
import org.eclipse.xtext.junit4.ui.AbstractWorkbenchTest
import org.eclipse.xtext.ui.XtextProjectHelper
import org.junit.Before
import org.junit.Test

import static extension org.eclipse.xtext.junit4.ui.util.IResourcesSetupUtil.*
import static extension org.eclipse.xtext.junit4.ui.util.JavaProjectSetupUtil.*

class EntitiesWorkbenchTest extends AbstractWorkbenchTest {

	val TEST_PROJECT = "mytestproject"

	@Before
	override void setUp() {
		super.setUp
		createJavaProjectWithXtextNature
	}

	@Test
	def void testValidProgram() {
		checkEntityProgram("entity E {}", 0)
	}

	@Test
	def void testNotValidProgram() {
		checkEntityProgram("foo", 1)
	}

	def void createJavaProjectWithXtextNature() {
		createJavaProject(TEST_PROJECT) => [
			getProject().addNature(XtextProjectHelper.NATURE_ID)
			addSourceFolder("entities-gen")
		]
	}

	def void checkEntityProgram(String contents, int expectedErrors) {
		val file = createFile(TEST_PROJECT + "/src/test.entities", contents)
		waitForBuild();
		assertEquals(expectedErrors, file.findMarkers(EValidator.MARKER, true, IResource.DEPTH_INFINITE).size);
	}

}
