package org.example.testutils

import com.google.inject.Inject
import com.google.inject.Provider
import java.util.List
import org.eclipse.core.resources.IMarker
import org.eclipse.core.resources.IResource
import org.eclipse.jdt.core.JavaCore
import org.eclipse.xtext.ui.XtextProjectHelper
import org.eclipse.xtext.ui.testing.util.JavaProjectSetupUtil
import org.eclipse.xtext.ui.util.PluginProjectFactory

import static org.eclipse.xtext.ui.testing.util.IResourcesSetupUtil.*
import static org.junit.Assert.*

class EclipseTestUtils {

	val static public TEST_PROJECT = "mytestproject"

	@Inject Provider<PluginProjectFactory> projectFactoryProvider

	val defaultBuilderIds = newArrayList(JavaCore.BUILDER_ID, "org.eclipse.pde.ManifestBuilder",
		"org.eclipse.pde.SchemaBuilder", XtextProjectHelper.BUILDER_ID)
	val defaultNatureIds = newArrayList(JavaCore.NATURE_ID, "org.eclipse.pde.PluginNature",
		XtextProjectHelper.NATURE_ID)

	def createJavaPluginProjectWithXtextNature() {
		createJavaPluginProjectWithXtextNature(#[])
	}

	def createJavaPluginProjectWithXtextNature(List<String> requiredBundles) {
		val projectFactory = projectFactoryProvider.get
		projectFactory.setProjectName(TEST_PROJECT);
		projectFactory.addFolders(newArrayList("src"));
		projectFactory.addFolders(newArrayList("src-gen"));
		projectFactory.addBuilderIds(defaultBuilderIds);
		projectFactory.addProjectNatures(defaultNatureIds);
		projectFactory.addRequiredBundles(requiredBundles)
		val result = projectFactory.createProject(monitor, null);
		JavaCore.create(result);
		return JavaProjectSetupUtil.findJavaProject(TEST_PROJECT);
	}

	def assertNoErrors() {
		val markers = getErrorMarkers()
		assertEquals(
			"unexpected errors:\n" +
			markers.map[getAttribute(IMarker.MESSAGE)].join('''

			'''),
			0, 
			markers.size
		)
	}

	def assertErrors(CharSequence expected) {
		val markers = getErrorMarkers()
		assertEquals(
			expected.toString,
			markers.map[getAttribute(IMarker.MESSAGE)].join('''

			''')
		)
	}

	def getErrorMarkers() {
		root.findMarkers(IMarker.PROBLEM, true, IResource.DEPTH_INFINITE).
			filter[
				getAttribute(IMarker.SEVERITY, IMarker.SEVERITY_INFO) == IMarker.SEVERITY_ERROR
			]
	}
}
