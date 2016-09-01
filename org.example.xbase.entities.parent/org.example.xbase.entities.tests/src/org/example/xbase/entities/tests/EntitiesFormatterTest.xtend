package org.example.xbase.entities.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.runner.RunWith
import org.eclipse.xtext.junit4.formatter.FormatterTester
import org.junit.Test

@RunWith(XtextRunner)
@InjectWith(EntitiesInjectorProvider)
class EntitiesFormatterTest {

	@Inject extension FormatterTester

	@Test
	def void testImportsFormatter() {
		assertFormatted[
			toBeFormatted = '''
				import java.util.List import java.util.Date
				entity E1 {}'''
			expectation = '''
				import java.util.List
				import java.util.Date
				
				entity E1 {
				}
			'''
		]
	}

	@Test
	def void testEntitiesFormatter() {
		assertFormatted[
			toBeFormatted = '''
				entity E1 {}
				entity  E2  < T  extends  Comparable < T >  >  extends  E1{}
				@Inject  @SuppressWarnings ( "all" ) entity  E3 extends E2 < String >  { }			'''
			expectation = '''
				entity E1 {
				}
				
				entity E2 <T extends Comparable<T>> extends E1 {
				}
				
				@Inject
				@SuppressWarnings("all")
				entity E3 extends E2<String> {
				}
			'''
		]
	}

	@Test
	def void testEntitiesWithAttributesAndOperationsFormatter() {
		assertFormatted[
			toBeFormatted = '''
				entity E1 { attr  int i ; attr  String s; attr  boolean b   ;
				op  void  m ( int  i ,  String  s ) {println  ( i  +  s ) }
				op  n (  ) {println  ( i  +  s ) } }
			'''
			expectation = '''
				entity E1 {
					attr int i;
					attr String s;
					attr boolean b;
					op void m(int i, String s) {
						println(i + s)
					}
					op n() {
						println(i + s)
					}
				}
			'''
		]
	}
}
