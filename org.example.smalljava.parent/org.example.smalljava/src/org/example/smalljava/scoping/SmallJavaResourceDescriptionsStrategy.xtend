package org.example.smalljava.scoping

import com.google.inject.Singleton
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.resource.IEObjectDescription
import org.eclipse.xtext.resource.impl.DefaultResourceDescriptionStrategy
import org.eclipse.xtext.util.IAcceptor
import org.example.smalljava.smallJava.SJBlock

@Singleton
class SmallJavaResourceDescriptionsStrategy extends DefaultResourceDescriptionStrategy {

	override createEObjectDescriptions(EObject e, IAcceptor<IEObjectDescription> acceptor) {
		if (e instanceof SJBlock) {
			// don't index contents of a block
			false
		} else
			super.createEObjectDescriptions(e, acceptor)
	}
}
