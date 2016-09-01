package org.example.xbase.entities.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.resource.XtextResource
import org.eclipse.xtext.xbase.imports.ImportOrganizer
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*
import org.eclipse.xtext.util.ReplaceRegion
import org.example.xbase.entities.entities.Model

/**
 * copied and adapted from the domain model example
 */
@RunWith(XtextRunner)
@InjectWith(EntitiesInjectorProvider)
class EntitiesOrganizeImportsTest {

	@Inject extension ParseHelper<Model>
	@Inject ImportOrganizer importOrganizer

	def protected assertIsOrganizedTo(CharSequence model, CharSequence expected) {
		val domainModel = parse(model.toString)
		val changes = importOrganizer.getOrganizedImportChanges(domainModel.eResource as XtextResource)
		val builder = new StringBuilder(model)
		val sortedChanges = changes.sortBy[offset]
		var ReplaceRegion lastChange = null
		for (it : sortedChanges) {
			if (lastChange != null && lastChange.endOffset > offset)
				fail("Overlapping text edits: " + lastChange + ' and ' + it)
			lastChange = it
		}
		for (it : sortedChanges.reverse)
			builder.replace(offset, offset + length, text)
		assertEquals(expected.toString, builder.toString)
	}

	@Test def testSimple() {
		'''
			entity Foo extends java.io.Serializable {}
		'''.assertIsOrganizedTo('''
			import java.io.Serializable
			
			entity Foo extends Serializable {}
		''')
	}

	@Test def testLeadingWhitespace() {
		'''
			«»
			   	
			entity Foo extends java.io.Serializable {}
		'''.assertIsOrganizedTo('''
			import java.io.Serializable
			
			entity Foo extends Serializable {}
		''')
	}

	@Test def testGetOrganizedImportSection_01() {
		'''
			import java.lang.String
			import java.util.List
			
			entity Foo {
			  op void test(List<String> s) {}
			}
		'''.assertIsOrganizedTo('''
			import java.util.List
			
			entity Foo {
			  op void test(List<String> s) {}
			}
		''')
	}

	@Test def testGetOrganizedImportSection_02() {
		'''
			import java.lang.String
			import java.util.List
			import java.util.List
			import java.util.List
			import java.lang.Integer
			
			entity Foo {
			  op void test(List<String> s) {}
			}
		'''.assertIsOrganizedTo('''
			import java.util.List
			
			entity Foo {
			  op void test(List<String> s) {}
			}
		''')
	}

	@Test def testGetOrganizedImportSection_03() {
		'''
			import java.util.*
			
			entity Foo {
			  op void test(List<String> s) {
			    val x = newArrayList('foo','bar')
			    Collections::sort(x)
			  }
			}
		'''.assertIsOrganizedTo('''
			import java.util.Collections
			import java.util.List
			
			entity Foo {
			  op void test(List<String> s) {
			    val x = newArrayList('foo','bar')
			    Collections::sort(x)
			  }
			}
		''')
	}

	@Test def testGetOrganizedImportSection_04() {
		'''
			import java.util.*
			import java.io.*
			
			entity Foo {
			  op void test(List<String> s) {
			    val x = new ArrayList<Map<StringBuilder,? extends Serializable>>()
			  }
			}
		'''.assertIsOrganizedTo('''
			import java.io.Serializable
			import java.util.ArrayList
			import java.util.List
			import java.util.Map
			
			entity Foo {
			  op void test(List<String> s) {
			    val x = new ArrayList<Map<StringBuilder,? extends Serializable>>()
			  }
			}
		''')
	}

	@Test def testNameClashSameFileWins() {
		'''
			entity Foo {
				attr java.lang.String x;
			}
			
			entity String {}
		'''.assertIsOrganizedTo('''
			entity Foo {
				attr java.lang.String x;
			}
			
			entity String {}
		''')
	}

	@Test def testStaticImport() {
		'''
			import static java.util.Collections.*
			entity Foo {
			  op void test(java.util.List<String> s) {
			  	shuffle(s)
			  }
			}
		'''.assertIsOrganizedTo('''
			import java.util.List
			
			import static java.util.Collections.*
			
			entity Foo {
			  op void test(List<String> s) {
			  	shuffle(s)
			  }
			}
		''')
	}

	@Test def testImplicitExtensions() {
		'''
			entity Foo {
			  op void test(java.util.List<String> s) {
			    s.head
			  }
			}
		'''.assertIsOrganizedTo('''
			import java.util.List
			
			entity Foo {
			  op void test(List<String> s) {
			    s.head
			  }
			}
		''')
	}

	@Test def testStaticExtensions() {
		'''
			import static extension java.util.Collections.*
			entity Foo {
			  op void test() {
			    typeof(java.util.Collections).singleton
			  }
			}
		'''.assertIsOrganizedTo('''
			import java.util.Collections
			
			import static extension java.util.Collections.*
			
			entity Foo {
			  op void test() {
			    typeof(Collections).singleton
			  }
			}
		''')
	}

	@Test def testJavaDoc() {
		'''
			/**
			 * {@link java.util.List}
			 */
			entity Foo {}
		'''.assertIsOrganizedTo('''
			import java.util.List
			
			/**
			 * {@link List}
			 */
			entity Foo {}
		''')
	}

}
