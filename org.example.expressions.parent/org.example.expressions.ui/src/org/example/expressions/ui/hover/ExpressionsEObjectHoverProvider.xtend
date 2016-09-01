package org.example.expressions.ui.hover

import com.google.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.Diagnostician
import org.eclipse.xtext.ui.editor.hover.html.DefaultEObjectHoverProvider
import org.example.expressions.expressions.Expression
import org.example.expressions.interpreter.ExpressionsInterpreter
import org.example.expressions.typing.ExpressionsTypeComputer

import static extension org.eclipse.emf.ecore.util.EcoreUtil.*

class ExpressionsEObjectHoverProvider extends DefaultEObjectHoverProvider {
	@Inject extension ExpressionsTypeComputer
	@Inject extension ExpressionsInterpreter

	override getHoverInfoAsHtml(EObject o) {
		if (o instanceof Expression && o.programHasNoError) {
			val exp = o as Expression
			return '''
				<p>
				type  : <b>«exp.typeFor.toString»</b> <br>
				value : <b>«exp.interpret.toString»</b>
				</p>
			'''
		} else
			return super.getHoverInfoAsHtml(o)
	}

	def programHasNoError(EObject o) {
		Diagnostician.INSTANCE.validate(o.rootContainer).children.empty
	}
}
