package org.example.xtend.examples

import java.util.LinkedList

class XtendTypeInference {
	def static void main(String[] args) {
		var myList = new LinkedList<Integer> // non final variable, type inferred
		println(myList)
		val aList = newArrayList
		aList += "" // now the type of aList is inferred as ArrayList<String>
	}
}
