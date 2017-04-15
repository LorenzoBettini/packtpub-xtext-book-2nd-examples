package org.example.entities.ui.quickfix

import org.eclipse.xtext.diagnostics.Diagnostic
import org.eclipse.xtext.ui.editor.quickfix.DefaultQuickfixProvider
import org.eclipse.xtext.ui.editor.quickfix.Fix
import org.eclipse.xtext.ui.editor.quickfix.IssueResolutionAcceptor
import org.eclipse.xtext.validation.Issue
import org.example.entities.entities.Attribute
import org.example.entities.entities.EntitiesFactory
import org.example.entities.entities.Entity
import org.example.entities.entities.Model
import org.example.entities.validation.EntitiesValidator

import static extension org.eclipse.xtext.EcoreUtil2.*

class EntitiesQuickfixProvider extends DefaultQuickfixProvider {

	@Fix(EntitiesValidator.INVALID_ENTITY_NAME)
	def void capitalizeEntityNameFirstLetter(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(
			issue,
			"Capitalize first letter", // label
			"Capitalize first letter of '" + issue.data.get(0) + "'", // description
			"Entity.gif", // icon
			[ context |
				val xtextDocument = context.xtextDocument
				val firstLetter = xtextDocument.get(issue.offset, 1);
				xtextDocument.replace(issue.offset, 1, firstLetter.toFirstUpper);
			]
		)
	}

	@Fix(EntitiesValidator.INVALID_ATTRIBUTE_NAME)
	def void uncapitalizeAttributeNameFirstLetter(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(
			issue,
			"Uncapitalize first letter", // label
			"Uncapitalize first letter of '" + issue.data.get(0) + "'", // description
			"Attribute.gif", // icon
			[ element, context |
				(element as Attribute).name = issue.data.get(0).toFirstLower
			]
		)
	}

	@Fix(EntitiesValidator.HIERARCHY_CYCLE)
	def void removeSuperType(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(
			issue,
			"Remove supertype",
			'''Remove supertype '«issue.data.get(0)»' ''',
			"delete_obj.gif",
			[ element, context |
				(element as Entity).superType = null;
			]
		)
	}

	@Fix(Diagnostic.LINKING_DIAGNOSTIC)
	def void createMissingEntity(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(
			issue,
			"Create missing entity",
			"Create missing entity",
			"Entity.gif",
			[ element, context |
				val currentEntity = element.getContainerOfType(Entity)
				val model = currentEntity.eContainer as Model
				model.entities.add(
					model.entities.indexOf(currentEntity) + 1,
					EntitiesFactory.eINSTANCE.createEntity() => [
						name = context.xtextDocument.get(issue.offset, issue.length)
					]
				)
			]
		)
	}
}
