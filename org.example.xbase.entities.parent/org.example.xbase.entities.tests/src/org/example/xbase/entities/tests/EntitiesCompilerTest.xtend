package org.example.xbase.entities.tests

import com.google.inject.Inject
import org.eclipse.xtext.diagnostics.Severity
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.TemporaryFolder
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper.Result
import org.eclipse.xtext.xbase.lib.util.ReflectExtensions
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(EntitiesInjectorProvider)
class EntitiesCompilerTest {

	@Rule
	@Inject public TemporaryFolder temporaryFolder

	@Inject extension CompilationTestHelper
	@Inject extension ReflectExtensions

	@Test
	def void testAttributeGeneratedCode() {
		'''
			/* my entity */
			entity MyEntity {
				/* my attribute */
				attr e = new MyEntity; // type is inferred
			}
		'''.assertCompilesTo(
		'''
			package entities;
			
			/**
			 * my entity
			 */
			@SuppressWarnings("all")
			public class MyEntity {
			  /**
			   * my attribute
			   */
			  private MyEntity e = new MyEntity();
			  
			  public MyEntity getE() {
			    return this.e;
			  }
			  
			  public void setE(final MyEntity e) {
			    this.e = e;
			  }
			  
			  public String toString() {
			    return
			    	"entity MyEntity {\n" +
			    		"\te = " + e.toString() + "\n" +
			    	"}";
			  }
			}
		''')
	}

	@Test
	def void testGenericSuperType() {
		'''
			entity MyList extends java.util.LinkedList<Iterable<String>>  {
			}
		'''.assertCompilesTo(
		'''
			package entities;
			
			import java.util.LinkedList;
			
			@SuppressWarnings("all")
			public class MyList extends LinkedList<Iterable<String>> {
			  public String toString() {
			    return
			    	"entity MyList {\n" +
			    	"}";
			  }
			}
		''')
	}

	@Test
	def void testValidGeneratedJavaCode() {
		'''
			entity MyEntity {
				attr e = new MyEntity;
			}
		'''.compile[compiledClass]
	}

	@Test
	def void testAnnotations() {
		'''
		import com.google.inject.Inject
		
		@SuppressWarnings("rawtypes")
		entity MyEntity {
			@Inject
			attr MyEntity e;
		}
		'''.compile[
			'''
			package entities;
			
			import com.google.inject.Inject;
			
			@SuppressWarnings("rawtypes")
			public class MyEntity {
			  @Inject
			  private MyEntity e;
			  
			  public MyEntity getE() {
			    return this.e;
			  }
			  
			  public void setE(final MyEntity e) {
			    this.e = e;
			  }
			  
			  public String toString() {
			    return
			    	"entity MyEntity {\n" +
			    		"\te = " + e.toString() + "\n" +
			    	"}";
			  }
			}
			'''.toString.assertEquals(singleGeneratedCode)
			checkValidationErrors
			compiledClass
		]
	}

	@Test
	def void testExtensionField() {
		'''
		import java.util.List
		
		entity ListExtension {
			op void printList(List<String> l) {
				// implementation
			}
		}
		
		entity MyEntity {
			attr extension ListExtension listExtension = new ListExtension();
			op void m(List<String> list) {
				// equivalent to listExtension.printList(list)
				list.printList
			}
		}
		'''.compile[
			'''
			package entities;
			
			import entities.ListExtension;
			import java.util.List;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyEntity {
			  @Extension
			  private ListExtension listExtension = new ListExtension();
			  
			  public ListExtension getListExtension() {
			    return this.listExtension;
			  }
			  
			  public void setListExtension(final ListExtension listExtension) {
			    this.listExtension = listExtension;
			  }
			  
			  public void m(final List<String> list) {
			    this.listExtension.printList(list);
			  }
			  
			  public String toString() {
			    return
			    	"entity MyEntity {\n" +
			    		"\tlistExtension = " + listExtension.toString() + "\n" +
			    	"}";
			  }
			}
			'''.toString.assertEquals(getGeneratedCode("entities.MyEntity"))
			checkValidationErrors
			compiledClass
		]
	}

	@Test
	def void testExtensionFieldAndExplicitAnnotation() {
		'''
		import java.util.List
		import com.google.inject.Inject
		
		entity ListExtension {
			op void printList(List<String> l) {
				// implementation
			}
		}
		
		entity MyEntity {
			@Inject
			attr extension ListExtension listExtension;
			op void m(List<String> list) {
				list.printList
			}
		}
		'''.compile[
			'''
			package entities;
			
			import com.google.inject.Inject;
			import entities.ListExtension;
			import java.util.List;
			import org.eclipse.xtext.xbase.lib.Extension;
			
			@SuppressWarnings("all")
			public class MyEntity {
			  @Extension
			  @Inject
			  private ListExtension listExtension;
			  
			  public ListExtension getListExtension() {
			    return this.listExtension;
			  }
			  
			  public void setListExtension(final ListExtension listExtension) {
			    this.listExtension = listExtension;
			  }
			  
			  public void m(final List<String> list) {
			    this.listExtension.printList(list);
			  }
			  
			  public String toString() {
			    return
			    	"entity MyEntity {\n" +
			    		"\tlistExtension = " + listExtension.toString() + "\n" +
			    	"}";
			  }
			}
			'''.toString.assertEquals(getGeneratedCode("entities.MyEntity"))
			checkValidationErrors
			compiledClass
		]
	}

	@Test
	def void testTypeParameters() {
		'''
		import java.util.List
		
		entity ListExtension<T extends Comparable<T>> {
			op void printList(List<T> l) {
				// implementation
			}
		}
		
		entity MyEntity {
			attr ListExtension<String> stringListExtension;
			attr ListExtension<Integer> intListExtension;
			op void m(List<String> stringList, List<Integer> intList) {
				stringListExtension.printList(stringList)
				intListExtension.printList(intList)
			}
		}
		'''.compile[
			'''
			package entities;
			
			import java.util.List;
			
			@SuppressWarnings("all")
			public class ListExtension<T extends Comparable<T>> {
			  public void printList(final List<T> l) {
			  }
			  
			  public String toString() {
			    return
			    	"entity ListExtension {\n" +
			    	"}";
			  }
			}
			'''.toString.assertEquals(getGeneratedCode("entities.ListExtension"))
			'''
			package entities;
			
			import entities.ListExtension;
			import java.util.List;
			
			@SuppressWarnings("all")
			public class MyEntity {
			  private ListExtension<String> stringListExtension;
			  
			  public ListExtension<String> getStringListExtension() {
			    return this.stringListExtension;
			  }
			  
			  public void setStringListExtension(final ListExtension<String> stringListExtension) {
			    this.stringListExtension = stringListExtension;
			  }
			  
			  private ListExtension<Integer> intListExtension;
			  
			  public ListExtension<Integer> getIntListExtension() {
			    return this.intListExtension;
			  }
			  
			  public void setIntListExtension(final ListExtension<Integer> intListExtension) {
			    this.intListExtension = intListExtension;
			  }
			  
			  public void m(final List<String> stringList, final List<Integer> intList) {
			    this.stringListExtension.printList(stringList);
			    this.intListExtension.printList(intList);
			  }
			  
			  public String toString() {
			    return
			    	"entity MyEntity {\n" +
			    		"\tstringListExtension = " + stringListExtension.toString() + "\n" +
			    		"\tintListExtension = " + intListExtension.toString() + "\n" +
			    	"}";
			  }
			}
			'''.toString.assertEquals(getGeneratedCode("entities.MyEntity"))
			checkValidationErrors
			compiledClass
		]
	}

	@Test
	def void testOperationGeneratedCodeWithImport() {
		'''
		import java.util.LinkedList;
		
		entity MyList extends java.util.LinkedList<String> {
			op insert(String s) {
				add(s)
			}
		}'''.assertCompilesTo(
		'''
			package entities;
			
			import java.util.LinkedList;
			
			@SuppressWarnings("all")
			public class MyList extends LinkedList<String> {
			  public boolean insert(final String s) {
			    return this.add(s);
			  }
			  
			  public String toString() {
			    return
			    	"entity MyList {\n" +
			    	"}";
			  }
			}
		''')
	}

	@Test
	def void testGeneratedToString() {
		'''
		entity C {
			attr l = newArrayList(1, 2, 3);
			attr s = "test";
		}'''.assertCompilesTo(
			'''
				package entities;
				
				import java.util.ArrayList;
				import org.eclipse.xtext.xbase.lib.CollectionLiterals;
				
				@SuppressWarnings("all")
				public class C {
				  private ArrayList<Integer> l = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(3));
				  
				  public ArrayList<Integer> getL() {
				    return this.l;
				  }
				  
				  public void setL(final ArrayList<Integer> l) {
				    this.l = l;
				  }
				  
				  private String s = "test";
				  
				  public String getS() {
				    return this.s;
				  }
				  
				  public void setS(final String s) {
				    this.s = s;
				  }
				  
				  public String toString() {
				    return
				    	"entity C {\n" +
				    		"\tl = " + l.toString() + "\n" +
				    		"\ts = " + s.toString() + "\n" +
				    	"}";
				  }
				}
			'''
		)
	}

	@Test
	def void testGeneratedToStringExecution() {
		'''
		entity C {
			attr l = newArrayList(1, 2, 3);
			attr s = "test";
		}'''.compile [
			val obj = it.compiledClass.newInstance
			'''
			entity C {
				l = [1, 2, 3]
				s = test
			}'''.toString.assertEquals(obj.invoke("toString"))
		]
	}

	private def void checkValidationErrors(Result it) {
		val allErrors = getErrorsAndWarnings.filter[severity == Severity.ERROR]
		if (!allErrors.empty) {
			throw new IllegalStateException(
				"One or more resources contained errors : " +
				allErrors.map[toString].join(", ")
			);
		}
	}
}
