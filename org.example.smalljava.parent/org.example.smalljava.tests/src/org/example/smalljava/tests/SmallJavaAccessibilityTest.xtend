package org.example.smalljava.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.example.smalljava.SmallJavaModelUtil
import org.example.smalljava.smallJava.SJMemberSelection
import org.example.smalljava.smallJava.SJProgram
import org.example.smalljava.smallJava.SJStatement
import org.example.smalljava.validation.SmallJavaAccessibility
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(SmallJavaInjectorProvider)
class SmallJavaAccessibilityTest {
	@Inject extension ParseHelper<SJProgram>
	@Inject extension SmallJavaAccessibility
	@Inject extension SmallJavaModelUtil

	@Test def void testFieldAccessibility() {
		'''
		class A {
			private D priv;
			protected D prot;
			public D pub;
			D m() {
				this.priv; // private field
				this.prot; // protected field
				this.pub; // public field
				return null;
			}
		}
		
		class B extends A {
			D m() {
				this.priv; // private field
				this.prot; // protected field
				this.pub; // public field
				return null;
			}
		}
		
		class C {
			D m() {
				(new A()).priv; // private field
				(new A()).prot; // protected field
				(new A()).pub; // public field
				return null;
			}
		}
		
		class D {}
		'''.parse.classes => [
			// method in A
			get(0).methods.get(0).body.statements => [
				get(0).assertMemberAccessible(true)
				get(1).assertMemberAccessible(true)
				get(2).assertMemberAccessible(true)
			]
			// method in B
			get(1).methods.get(0).body.statements => [
				get(0).assertMemberAccessible(false)
				get(1).assertMemberAccessible(true)
				get(2).assertMemberAccessible(true)
			]
			// method in C
			get(2).methods.get(0).body.statements => [
				get(0).assertMemberAccessible(false)
				get(1).assertMemberAccessible(false)
				get(2).assertMemberAccessible(true)
			]
		]
	}

	@Test def void testMethodAccessibility() {
		'''
		class A {
			private D priv() { return null; }
			protected D prot() { return null; }
			public D pub() { return null; }
			D m() {
				this.priv(); // private method
				this.prot(); // protected method
				this.pub(); // public method
				return null;
			}
		}
		
		class B extends A {
			D m() {
				this.priv(); // private method
				this.prot(); // protected method
				this.pub(); // public method
				return null;
			}
		}
		
		class C {
			D m() {
				(new A()).priv(); // private method
				(new A()).prot(); // protected method
				(new A()).pub(); // public method
				return null;
			}
		}
		
		class D {}
		'''.parse.classes => [
			// method in A
			get(0).methods.last.body.statements => [
				get(0).assertMemberAccessible(true)
				get(1).assertMemberAccessible(true)
				get(2).assertMemberAccessible(true)
			]
			// method in B
			get(1).methods.last.body.statements => [
				get(0).assertMemberAccessible(false)
				get(1).assertMemberAccessible(true)
				get(2).assertMemberAccessible(true)
			]
			// method in C
			get(2).methods.last.body.statements => [
				get(0).assertMemberAccessible(false)
				get(1).assertMemberAccessible(false)
				get(2).assertMemberAccessible(true)
			]
		]
	}
	
	def private assertMemberAccessible(SJStatement s, boolean expected) {
		val sel = s as SJMemberSelection
		expected.assertEquals(
			sel.member.isAccessibleFrom(sel))
	}
}