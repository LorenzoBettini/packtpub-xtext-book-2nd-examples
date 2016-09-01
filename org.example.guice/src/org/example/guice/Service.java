package org.example.guice;

import com.google.inject.Inject;

public class Service {
	@Inject private Logger logger;
	@Inject private Processor processor;
	
	public void execute(String command) {
		logger.log("executing " + command);
		processor.process(command);
		logger.log("executed " + command);
	}
}
