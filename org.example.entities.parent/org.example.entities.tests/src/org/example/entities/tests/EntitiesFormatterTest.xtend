package org.example.entities.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.formatter.FormatterTestHelper
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(EntitiesInjectorProvider)
class EntitiesFormatterTest {

	@Inject extension FormatterTestHelper

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
