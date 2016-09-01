package org.example.customgreetings.greetings.impl;

public class GreetingImplCustom extends GreetingImpl {

	@Override
	public String toString() {
		return "Hello " + getName();
	}

}
