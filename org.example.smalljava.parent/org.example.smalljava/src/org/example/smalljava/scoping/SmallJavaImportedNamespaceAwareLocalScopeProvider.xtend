package org.example.smalljava.scoping

import com.google.inject.Inject
import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.naming.IQualifiedNameProvider
import org.eclipse.xtext.naming.QualifiedName
import org.eclipse.xtext.scoping.impl.ImportNormalizer
import org.eclipse.xtext.scoping.impl.ImportedNamespaceAwareLocalScopeProvider
import org.example.smalljava.smallJava.SJProgram

class SmallJavaImportedNamespaceAwareLocalScopeProvider extends ImportedNamespaceAwareLocalScopeProvider {
	@Inject extension IQualifiedNameProvider

	override getImplicitImports(boolean ignoreCase) {
		newArrayList(new ImportNormalizer(
			QualifiedName.create("smalljava", "lang"),
			true, // wildcard
			ignoreCase
		))
	}

	override protected List<ImportNormalizer> internalGetImportedNamespaceResolvers(EObject context, boolean ignoreCase) {
		val resolvers = super.internalGetImportedNamespaceResolvers(context, ignoreCase)
		if (context instanceof SJProgram) {
			val fqn = context.fullyQualifiedName
			// fqn is the package of this program
			if (fqn != null) {
				// all the external classes with the same package of this program
				// will be automatically visible in this program, without an import
				resolvers += new ImportNormalizer(
					fqn,
					true, // use wildcards
					ignoreCase
				)
			}
		}
		return resolvers
	}

}
