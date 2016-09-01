package org.example.xtend.examples

import java.util.Collections

class StaticMethods {
	def static void main(String[] args) {
		val empty = Collections.emptyList
		System.out.println(empty)
		
		val list = newArrayList("a", "b", "c")
		println(list.head) // prints a
		println(list.last) // prints b
	}
}
