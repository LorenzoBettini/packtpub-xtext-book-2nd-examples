package org.example.guice.impl;

public class AdvancedProcessor extends ProcessorImpl {
	@Override
	public void process(Object o) {
		super.process(o);
		System.out.println("ADVANCED processing " + o);
	}
}
