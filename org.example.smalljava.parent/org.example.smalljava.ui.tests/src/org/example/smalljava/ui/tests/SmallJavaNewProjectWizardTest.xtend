package org.example.smalljava.ui.tests

import com.google.inject.Inject
import com.google.inject.Provider
import org.eclipse.jface.viewers.StructuredSelection
import org.eclipse.jface.wizard.Wizard
import org.eclipse.jface.wizard.WizardDialog
import org.eclipse.ui.PlatformUI
import org.eclipse.xtext.junit4.ui.AbstractWorkbenchTest
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.example.smalljava.ui.SmallJavaTestableNewProjectWizard
import org.example.testutils.EclipseTestUtils
import org.example.testutils.PDETargetPlatformUtils
import org.junit.BeforeClass
import org.junit.Test
import org.junit.runner.RunWith

import static org.eclipse.xtext.junit4.ui.util.IResourcesSetupUtil.*
import static org.example.testutils.EclipseTestUtils.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaUiInjectorProvider)
class SmallJavaNewProjectWizardTest extends AbstractWorkbenchTest {

	@Inject extension EclipseTestUtils

	@Inject Provider<SmallJavaTestableNewProjectWizard> wizardProvider

	/**
	 * Create the wizard dialog, open it and press Finish.
	 */
	def protected int createAndFinishWizardDialog(Wizard wizard) {
		val dialog = new WizardDialog(wizard.shell, wizard) {
			override open() {
				val thread = new Thread("Press Finish") {
					override run() {
						// wait for the shell to become active
						while (getShell() === null) {
							Thread.sleep(1000)
						}
						getShell().getDisplay().asyncExec [
							finishPressed();
						]
					}
				};
				thread.start();
				return super.open();
			}
		};
		return dialog.open();
	}

	@BeforeClass
	def static void beforeClass() {
		// needed when building with Tycho, otherwise, dependencies
		// in the MANIFEST of the created project will not be visible
		PDETargetPlatformUtils.setTargetPlatform();
	}

	@Test def void testSmallJavaNewProjectWizard() {
		createProjectWithNewProjectWizard
		assertNoErrors
	}

	def private createProjectWithNewProjectWizard() {
		val wizard = wizardProvider.get
		wizard.init(PlatformUI.getWorkbench(), new StructuredSelection());
		createAndFinishWizardDialog(wizard)
		val project = root.getProject(TEST_PROJECT)
		assertTrue(project.exists())
		cleanBuild
		waitForBuild
		return project
	}
}
