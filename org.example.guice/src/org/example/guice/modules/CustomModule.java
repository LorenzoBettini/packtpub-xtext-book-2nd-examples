package org.example.guice.modules;

import org.example.guice.Logger;
import org.example.guice.Processor;
import org.example.guice.Utility;
import org.example.guice.impl.AdvancedProcessor;
import org.example.guice.impl.CustomLogger;

import com.google.inject.AbstractModule;

public class CustomModule extends AbstractModule {

	@Override
	protected void configure() {
		bind(Logger.class).to(CustomLogger.class);
		bind(Processor.class).to(AdvancedProcessor.class);
		bind(Utility.class).to(CustomUtility.class);
	}

}
