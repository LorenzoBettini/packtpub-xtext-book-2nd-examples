package org.example.guice.impl;

import org.example.guice.Logger;
import org.example.guice.Processor;

import com.google.inject.Inject;

public class ProcessorImpl implements Processor {

	@Inject private Logger logger;
	
	public void process(Object o) {
		logger.log("processing");
		System.out.println("processing " + o + "...");
	}

}
