package org.example.xtend.examples

class XtendCollectionLiterals {
	def static void main(String[] args) {
		val myList = #['Hello','World']
		val String[] myArray = #['Hello','World']
		val mySet = #{'Hello','World'}
		val myMap = #{'a' -> 1 ,'b' ->2}
		
		println(myList)
		println(myArray)
		println(mySet)
		println(myMap)
	}
}