package org.example.xbase.expressions.compiler

import com.google.inject.Inject
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.eclipse.xtext.xbase.typesystem.IBatchTypeResolver
import org.example.xbase.expressions.expressions.EvalExpression

class ExpressionsCompiler extends XbaseCompiler {

	@Inject IBatchTypeResolver batchTypeResolver

	override protected doInternalToJavaStatement(XExpression obj, ITreeAppendable a, boolean isReferenced) {
		if (obj instanceof EvalExpression) {
			obj.expression.internalToJavaStatement(a, true)
			a.newLine
			if (isReferenced) {
				val e = obj.expression
				val name = a.declareSyntheticVariable(obj, "_eval")
				a.append('''String «name» = ''')
				e.generateStringConversion(a)
				e.internalToJavaExpression(a)
				a.append(";")
			} else {
				a.append('''System.out.println(''')
				obj.expression.internalToJavaExpression(a)
				a.append(");")
			}
		} else
			super.doInternalToJavaStatement(obj, a, isReferenced)
	}

	def private generateStringConversion(XExpression e, ITreeAppendable a) {
		val actualType = batchTypeResolver.resolveTypes(e).getActualType(e)
		if (!actualType.isType(String)) {
			a.append('''"" + ''')
		}
	}

	override protected internalToConvertedExpression(XExpression obj, ITreeAppendable a) {
		if (obj instanceof EvalExpression) {
			if (a.hasName(obj)) {
				a.append(getVarName(obj, a))
			} else {
				// compile the eval directly as a Java expression
				val e = obj.expression
				a.append("(")
				e.generateStringConversion(a)
				e.internalToJavaExpression(a)
				a.append(")")
			}
		} else
			super.internalToConvertedExpression(obj, a)
	}

	override protected internalCanCompileToJavaExpression(XExpression e, ITreeAppendable a) {
		if (e instanceof EvalExpression)
			return e.expression.internalCanCompileToJavaExpression(a)
		else
			super.internalCanCompileToJavaExpression(e, a)
	}

}
