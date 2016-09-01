package org.example.guice.main;

import org.example.guice.Service;
import org.example.guice.modules.CustomModule;
import org.example.guice.modules.StandardModule;

import com.google.inject.Guice;
import com.google.inject.Injector;

public class ServiceApplication {

	public static void main(String[] args) {
		executeService(Guice.createInjector(new StandardModule()));
		executeService(Guice.createInjector(new CustomModule()));
	}

	private static void executeService(Injector injector) {
		Service service = injector.getInstance(Service.class);
		service.execute("First command");
		service.execute("Second command");
	}
}
