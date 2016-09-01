package org.example.smalljava

import com.google.inject.Inject
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.ResourceSet
import org.example.smalljava.scoping.SmallJavaIndex
import org.example.smalljava.smallJava.SJClass

class SmallJavaLib {
	@Inject extension SmallJavaIndex

	public val static MAIN_LIB = "smalljava/lang/mainlib.smalljava"

	public val static LIB_PACKAGE = "smalljava.lang"
	public val static LIB_OBJECT = LIB_PACKAGE + ".Object"
	public val static LIB_STRING = LIB_PACKAGE + ".String"
	public val static LIB_INTEGER = LIB_PACKAGE + ".Integer"
	public val static LIB_BOOLEAN = LIB_PACKAGE + ".Boolean"

	private static final Logger LOG = Logger.getLogger(SmallJavaLib);

	def loadLib(ResourceSet resourceSet) {
		val url = getClass().getClassLoader().getResource(MAIN_LIB)
		val stream = url.openStream
		val urlPath = url.path
		val resource = resourceSet.createResource(URI.createFileURI(urlPath))
		LOG.info("loading library " + urlPath)
		resource.load(stream, resourceSet.getLoadOptions())
	}

	def getSmallJavaObjectClass(EObject context) {
		val desc = context.getVisibleClassesDescriptions.findFirst[qualifiedName.toString == LIB_OBJECT]
		if (desc == null)
			return null
		var o = desc.EObjectOrProxy
		if (o.eIsProxy)
			o = context.eResource.resourceSet.getEObject(desc.EObjectURI, true)
		o as SJClass
	}
}
