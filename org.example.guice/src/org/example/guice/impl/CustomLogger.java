package org.example.guice.impl;

import org.example.guice.Logger;

public class CustomLogger extends Logger {
	@Override
	public void log(String message) {
		super.log("*** " + message);
	}
}
