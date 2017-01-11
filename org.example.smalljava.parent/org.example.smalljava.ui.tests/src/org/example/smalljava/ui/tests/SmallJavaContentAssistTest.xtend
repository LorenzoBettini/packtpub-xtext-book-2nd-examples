package org.example.smalljava.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.xbase.junit.ui.AbstractContentAssistTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(SmallJavaUiInjectorProvider))
class SmallJavaContentAssistTest extends AbstractContentAssistTest {

	// IMPORTANT: since our scoping uses the index and the containers
	// we must make sure that the Xtext resources used in these tests
	// are handled by the dirty stage manager.

	@Test
	def void testMembers() {
		newBuilder.withDirtyState.append(
		'''
		class A {
			A f;
			A m() { return null; }
			A n() { this. '''
		).assertText('f', 'm', 'n')
	}

	@Test
	def void testMembersWithType() {
		newBuilder.withDirtyState.append(
		'''
		class A {
			A f;
			A m() { return null; }
			A n() { this.<|>'''
		).assertProposalDisplayedAtCursor("f : A - A")
	}

	@Test
	def void testProtectedMembers() {
		newBuilder.withDirtyState.append(
		'''
		class A1 {
			private A1 priv;
			protected A1 prot;
			public A1 pub;
			
			private A1 privM() { return null; }
			protected A1 protM() { return null; }
			public A1 pubM() { return null; }
		}
		
		class B1 extends A1 {
			A1 n() { new A1(). '''
		).assertText('prot', 'pub', 'protM', 'pubM')
	}

	@Test
	def void testPrivateMembers() {
		newBuilder.withDirtyState.append(
		'''
		class A1 {
			private A1 priv;
			protected A1 prot;
			public A1 pub;
			
			private A1 privM() { return null; }
			protected A1 protM() { return null; }
			public A1 pubM() { return null; }
		}
		
		class B1 {
			A1 n() { new A1(). '''
		).assertText('pub', 'pubM')
	}

}