# Changes required by new versions of Xtext

The book was written using Xtext 2.10.0 and some changes were introduced in new versions of Xtext that require some modifications in the sources of the examples (moreover, some code shown in the book might have to be adapted accordingly).

In the following we detail the changes required to adapt the examples to the new versions of Xtext.

## Xtext 2.11

### Grammar language

The grammar language now supports Java-like annotations; for the moment the annotation `@Override` should be added when you redefine a rule from the parent grammar.  You will get a warning in the editor and a quickfix to add the missing annotation.

For example, in the **Xbase Expressions DSL** the redefined rule should become:

```
@Override 
XPrimaryExpression returns XExpression:
	{EvalExpression} 'eval' expression=XExpression |
	super;
```

### Testing

Many classes from the bundle `org.eclipse.xtext.junit4` have been deprecated: you should now use `org.eclipse.xtext.testing`, which basically provides the same classes, but with with the package `org.eclipse.xtext.testing` instead of `org.eclipse.xtext.junit4`.  The same holds for most classes in `org.eclipse.xtext.xbase.junit`, you should now use the ones from `org.eclipse.xtext.xbase.testing`.
 
Running the mwe2 generator will add the new bundles as dependencies, but you will have to remove the old ones manually from the MANIFEST.MF.  Moreover, the generated injector providers for tests are based on the new bundle, so you will need to manually modify your test cases so that they import and use the new packages (once you removed the old bundle from the dependencies, an "Organize Imports" should automatically fix the imports; if not, please remove manually the old imports and perform an "Organize Imports").

`org.eclipse.xtext.xbase.junit.formatter.FormatterTester` must be replaced with `org.eclipse.xtext.testing.formatter.FormatterTestHelper`.

Similar adaptions will have to be performed also in the `.ui.tests` project.  However, for UI tests, `org.eclipse.xtext.junit4` and `org.eclipse.xtext.xbase.junit` are still required, since not all the testing classes have been ported to the new bundles (**TODO**: check the status of <https://github.com/eclipse/xtext-eclipse/issues/156>).

### Xtend warnings

Xtend now has a warning of the shape `The operator '!=' should be replaced by '!==' when null is one of the arguments.`, the same holds for `==` and `===`, suggesting to use actual reference equality check instead of '!=' or `==` (which in Xtend is translated into a call of `equals` method).

### Xbase

The Xbase compiler has been optimized in order to reduce the numbers of additional synthetic variables that are generated.  The compilation tests will have to be adapted, in case you were comparing the result of the compilation with an expected result.

For example, instead of Java code of the shape

```Java
Integer _get = a.get(_plusPlus);
InputOutput.<Integer>println(_get);
```

The Xbase compile now generates:

```Java
InputOutput.<Integer>println(a.get(_plusPlus));
```

### Maven build

The mwe2.launch version in the `pom.xml` used in the main project for running MWE2 during the Maven build should be updated from 2.8.3 to at least 2.9.0:

```XML
<dependency>
	<groupId>org.eclipse.emf</groupId>
	<artifactId>org.eclipse.emf.mwe2.launch</artifactId>
	<version>[2.9.0,2.10)</version>
</dependency>
```

Two additional Maven dependencies should be added in that part:

```XML
<dependency>
	<groupId>org.eclipse.xtext</groupId>
	<artifactId>org.eclipse.xtext.common.types</artifactId>
	<version>${xtextVersion}</version>
</dependency>
<dependency>
	<groupId>org.eclipse.xtext</groupId>
	<artifactId>xtext-antlr-generator</artifactId>
	<version>[2.1.1, 3.0)</version>
</dependency>
```

### Web integration project

A few things have changed concerning Web support that requires manual modifications to Xtend classes in src folder.  If you did not customize anything in the `.web` project, the easiest way is to simply remove that project and run the MWE2 workflow to have that project created from scratch.

Otherwise, these are the manual steps to perform.

In the XXXWebModule you can remove the annotation `@FinalFieldsConstructor`.

The XXXWebSetup must be modified so that it uses the addition Guice modules generated in the .ide project.

For example, instead of

```Java
class SmallJavaWebSetup extends SmallJavaStandaloneSetup {
	
	val Provider<ExecutorService> executorServiceProvider;
	
	override Injector createInjector() {
		val runtimeModule = new SmallJavaRuntimeModule()
		val webModule = new SmallJavaWebModule(executorServiceProvider)
		return Guice.createInjector(Modules.override(runtimeModule).with(webModule))
	}
	
}
```

You should write

```Java
class SmallJavaWebSetup extends SmallJavaStandaloneSetup {
	
	override Injector createInjector() {
		return Guice.createInjector(Modules2.mixin(new SmallJavaRuntimeModule, new SmallJavaIdeModule, new SmallJavaWebModule))
	}
	
}
```

Similarly for the XXXServlet:

```Java
@WebServlet(name = 'XtextServices', urlPatterns = '/xtext-service/*')
class SmallJavaServlet extends XtextServlet {
	
	val List<ExecutorService> executorServices = newArrayList
	
	override init() {
		super.init()
		val Provider<ExecutorService> executorServiceProvider = [Executors.newCachedThreadPool => [executorServices += it]]
		new SmallJavaWebSetup(executorServiceProvider).createInjectorAndDoEMFRegistration()
	}
	
	override destroy() {
		executorServices.forEach[shutdown()]
		executorServices.clear()
		super.destroy()
	}
	
}
```

should become

```Java
@WebServlet(name = 'XtextServices', urlPatterns = '/xtext-service/*')
class SmallJavaServlet extends XtextServlet {
	
	DisposableRegistry disposableRegistry
	
	override init() {
		super.init()
		val injector = new SmallJavaWebSetup().createInjectorAndDoEMFRegistration()
		disposableRegistry = injector.getInstance(DisposableRegistry)
	}
	
	override destroy() {
		if (disposableRegistry !== null) {
			disposableRegistry.dispose()
			disposableRegistry = null
		}
		super.destroy()
	}
	
}
```

The Maven dependencies in the pom.xml should be updated to newer versions, e.g.,

```XML
<dependency>
	<groupId>org.webjars</groupId>
	<artifactId>requirejs</artifactId>
	<version>2.3.2</version>
</dependency>
<dependency>
	<groupId>org.webjars</groupId>
	<artifactId>jquery</artifactId>
	<version>2.2.4</version>
</dependency>
<dependency>
	<groupId>org.webjars</groupId>
	<artifactId>ace</artifactId>
	<version>1.2.3</version>
</dependency>
<dependency>
	<groupId>org.eclipse.jetty</groupId>
	<artifactId>jetty-annotations</artifactId>
	<version>9.3.8.v20160314</version>
	<scope>provided</scope>
</dependency>
<dependency>
	<groupId>org.slf4j</groupId>
	<artifactId>slf4j-simple</artifactId>
	<version>1.7.21</version>
	<scope>provided</scope>
</dependency>
```

The `WebRoot/index.html` must be adapted to the new versions of used dependencies.  The easiest thing to do is to remove that file and have MWE2 regenerate it.

### IntelliJ support

Currently, Xtext 2.11 for the IntelliJ support has not been released yet.  If you want to try Xtext support for IntelliJ you need to stick with Xtext 2.10.0.

