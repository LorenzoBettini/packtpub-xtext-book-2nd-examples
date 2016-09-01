package org.example.entities.tests

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
	def void testEntitiesFormatter() {
		assertFormatted[
			toBeFormatted = '''
				entity E1 { int i ; string s; boolean b   ;}
				entity  E2  extends  E1{}
			'''
			expectation = '''
				entity E1 {
					int i;
					string s;
					boolean b;
				}
				
				entity E2 extends E1 {
				}
			'''
		]
	}
}
