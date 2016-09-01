package org.example.xtend.examples

import java.util.List

class PersonUtil {
	def static mysort(List<Person> persons) {
		persons.sortBy[surname + " " + firstname + " " + age]
	}
	
	def static asString(List<Person> persons) {
		persons.map[
			firstname + " " + surname + " (" + age + ")"
		].join(", ")
	}
	
	def static findByName(List<Person> persons, String name) {
		persons.findFirst[firstname == name]
	}
	
	def static void main(String[] args) {
		val personList = newArrayList(
			new Person("James", "Smith", 50),
			new Person("John", "Smith", 40),
			new Person("James", "Anderson", 40),
			new Person("John", "Anderson", 30),
			new Person("Paul", "Anderson", 30)
		)
		println(asString(mysort(personList)))
		
		val result = personList.filter[firstname.startsWith("J")].
			sortBy[age].take(3).map[surname + ", " + firstname].
				join("; ")
		println(result)
	}
	
}