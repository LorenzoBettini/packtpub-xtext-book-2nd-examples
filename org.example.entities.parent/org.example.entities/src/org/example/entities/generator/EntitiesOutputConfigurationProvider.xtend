package org.example.entities.generator

import org.eclipse.xtext.generator.OutputConfigurationProvider

class EntitiesOutputConfigurationProvider extends OutputConfigurationProvider {
	public static val ENTITIES_GEN = "./entities-gen"

	override getOutputConfigurations() {
		super.getOutputConfigurations() => [
			head.outputDirectory = ENTITIES_GEN
		]
	}
}
