package org.example.xbase.entities.ui.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.testing.AbstractWorkbenchTest
import org.example.testutils.EclipseTestUtils
import org.example.testutils.PDETargetPlatformUtils
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test
import org.junit.runner.RunWith

import static org.eclipse.xtext.ui.testing.util.IResourcesSetupUtil.*
import static org.example.testutils.EclipseTestUtils.*

@RunWith(XtextRunner)
@InjectWith(EntitiesUiInjectorProvider)
class XbaseEntitiesWorkbenchTest extends AbstractWorkbenchTest {

	@Inject extension EclipseTestUtils

	@BeforeClass
	def static void beforeClass() {
		// needed when building with Tycho, otherwise, dependencies
		// in the MANIFEST of the created project will not be visible
		PDETargetPlatformUtils.setTargetPlatform();
	}

	@Before
	override void setUp() {
		super.setUp
		createJavaPluginProjectWithXtextNature(
			#[
				"org.eclipse.xtext.xbase.lib",
				"com.google.inject"
			]
		)
	}

	@Test
	def void testErrorInGeneratedJavaCode() {
		createFile(
			TEST_PROJECT + "/src/test.xentities",
			'''
				import com.google.inject.Inject
						
				@Inject
				entity MyEntity {
					
				}
			'''
		)

		waitForBuild
		// one error in the generated Java file, and one in the original file
		assertErrors(
			'''
			Java problem: The annotation @Inject is disallowed for this location
			The annotation @Inject is disallowed for this location'''
		)
	}

}
