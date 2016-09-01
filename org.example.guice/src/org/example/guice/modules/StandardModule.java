package org.example.guice.modules;

import org.example.guice.Processor;
import org.example.guice.impl.ProcessorImpl;

import com.google.inject.AbstractModule;

public class StandardModule extends AbstractModule {

	@Override
	protected void configure() {
		bind(Processor.class).to(ProcessorImpl.class);
	}

}
