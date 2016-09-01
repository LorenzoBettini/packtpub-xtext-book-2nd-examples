package org.example.guice;

import com.google.inject.Inject;
import com.google.inject.Provider;

public class Logger {
    @Inject
    private Provider<Utility> utilityProvider;
    
	public void log(String message) {
		System.out.println("LOG: " + message + " - " + 
		        utilityProvider.get().m());
	}
}
