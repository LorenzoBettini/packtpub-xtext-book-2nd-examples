package org.example.guice.main;

import org.example.guice.Logger;
import org.example.guice.modules.CustomModuleWithSingletonLogger;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Provider;

public class ServiceApplication2 {

	public static void main(String[] args) {
		Injector injector = Guice.createInjector(new CustomModuleWithSingletonLogger());
		System.out.println(injector.getInstance(Logger.class));
		System.out.println(injector.getInstance(Logger.class));
		Provider<Logger> provider = injector.getProvider(Logger.class);
		System.out.println(provider.get());
		System.out.println(provider.get());
	}

}
