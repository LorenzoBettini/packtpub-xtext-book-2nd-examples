package org.example.smalljava.ui.tests

import com.google.inject.Inject
import org.eclipse.core.resources.IFile
import org.eclipse.core.resources.IMarker
import org.eclipse.core.resources.IResource
import org.eclipse.emf.ecore.EValidator
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.testing.AbstractWorkbenchTest
import org.eclipse.xtext.util.StringInputStream
import org.example.testutils.EclipseTestUtils
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith

import static org.eclipse.xtext.ui.testing.util.IResourcesSetupUtil.*
import static org.example.testutils.EclipseTestUtils.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaUiInjectorProvider)
class SmallJavaWorkbenchTest extends AbstractWorkbenchTest {

	@Inject extension EclipseTestUtils

	@Before
	override void setUp() {
		super.setUp
		createJavaPluginProjectWithXtextNature
	}

	def void checkSmallJavaPrograms(String program1, String program2, int expectedErrors) {
		val file1 = createFile(TEST_PROJECT + "/src/test1.smalljava", program1)
		val file2 = createFile(TEST_PROJECT + "/src/test2.smalljava", program2)
		waitForBuild();
		assertEquals(expectedErrors, findResourceMarkers(file1).size);
		assertEquals(expectedErrors, findResourceMarkers(file2).size);
	}

	private def IMarker[] findResourceMarkers(IFile file1) {
		file1.findMarkers(EValidator.MARKER, true, IResource.DEPTH_INFINITE)
	}

	@Test
	def void testValidPrograms() {
		checkSmallJavaPrograms(
		'''
			package my.pack;
			class C {}
		''', '''
			package my.pack;
			class D {}
		''', 0)
	}

	@Test
	def void testNotValidPrograms() {
		checkSmallJavaPrograms(
		'''
			package my.pack;
			class D {}
		''', '''
			package my.pack;
			class D {}
		''', 1) // each file will have an error
		// due to duplicate class name
	}

	@Test
	def void testNotValidProgramAfterNewFileWithDuplicateAndClean() {
		val file1 = createFile(
			TEST_PROJECT + "/src/test1.smalljava",
			'''
				package my.pack;
				class D {}
			'''
		)
		waitForBuild();
		assertEquals(0, findResourceMarkers(file1).size);
		val file2 = createFile(
			TEST_PROJECT + "/src/test2.smalljava",
			'''
				package my.pack;
				class D {}
			'''
		)
		cleanBuild
		waitForBuild
		assertEquals(1, findResourceMarkers(file1).size);
		assertEquals(1, findResourceMarkers(file2).size);
	}

	@Test
	def void testChangeMethodInvalidatesClassWhichUsesThatMethod() {
		val file1 = createFile(
			TEST_PROJECT + "/src/test1.smalljava",
			'''
				class D {
					public D m() {
						return null;
					}
				}
			'''
		)
		createFile(
			TEST_PROJECT + "/src/test2.smalljava",
			'''
				class C {
					public D n() {
						return new D().m();
					}
				}
			'''
		)
		waitForBuild();
		assertNoErrors

		file1.setContents(new StringInputStream('''
			class D {
				public D foo() {
					return null;
				}
			}
		'''), true, false, monitor())
		waitForBuild();
		assertErrors(
			"Couldn't resolve reference to SJMember 'm'."
		)
	}

	@Test
	def void testChangeMethodParametersInvalidatesClassWhichUsesThatMethod() {
		val file1 = createFile(
			TEST_PROJECT + "/src/test1.smalljava",
			'''
				class D {
					public D m() {
						return null;
					}
				}
			'''
		)
		createFile(
			TEST_PROJECT + "/src/test2.smalljava",
			'''
				class C {
					public D n() {
						return new D().m();
					}
				}
			'''
		)
		waitForBuild();
		assertNoErrors

		file1.setContents(new StringInputStream('''
			class D {
				public D m(D d) {
					return null;
				}
			}
		'''), true, false, monitor())
		waitForBuild();
		assertErrors(
			"Invalid number of arguments: expected 1 but was 0"
		)
	}

	@Test
	def void testChangeMethodParameterTypeInvalidatesClassWhichUsesThatMethod() {
		val file1 = createFile(
			TEST_PROJECT + "/src/test1.smalljava",
			'''
				class D {
					public D m(D d) {
						return null;
					}
				}
			'''
		)
		createFile(
			TEST_PROJECT + "/src/test2.smalljava",
			'''
				class C {
					public D n() {
						return new D().m(new D());
					}
				}
			'''
		)
		waitForBuild();
		assertNoErrors

		file1.setContents(new StringInputStream('''
			class D {
				public D m(C c) {
					return null;
				}
			}
		'''), true, false, monitor())
		waitForBuild();
		// the second one shows that C is not regenerated
		assertErrors(
			'''
			Incompatible types. Expected 'C' but was 'D'
			C cannot be resolved to a type'''
		)
	}

}
