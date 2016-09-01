package org.example.xbase.entities.validation

import org.eclipse.xtext.preferences.PreferenceKey
import org.eclipse.xtext.util.IAcceptor
import org.eclipse.xtext.validation.SeverityConverter
import org.eclipse.xtext.xbase.validation.IssueCodes
import org.eclipse.xtext.xbase.validation.XbaseConfigurableIssueCodes

class EntitiesConfigurableIssueCodes extends XbaseConfigurableIssueCodes {

	override protected initialize(IAcceptor<PreferenceKey> iAcceptor) {
		super.initialize(iAcceptor)
		iAcceptor.accept(create(IssueCodes.COPY_JAVA_PROBLEMS,
				SeverityConverter.SEVERITY_ERROR))
	}

}