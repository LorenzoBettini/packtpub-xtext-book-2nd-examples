package org.example.xtend.examples

class XtendCodeGenerator {
	def generateBody(String name, String body) '''
		/* body of «name» */
		«body»
	'''

	def generateMethod(String name, String body) '''
		public void «name»() {
			«generateBody(name, body)»
		}
	'''

	def static void main(String[] args) {
		val generator = new XtendCodeGenerator
		println(generator.generateMethod("m",
			'''
				System.out.println("Hello");
				return;
			'''
		))
	}
}
