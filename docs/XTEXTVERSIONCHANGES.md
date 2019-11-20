# Changes required by new versions of Xtext

The book was written using Xtext 2.10.0 and some changes were introduced in new versions of Xtext that require some modifications in the sources of the examples (moreover, some code shown in the book might have to be adapted accordingly).

In the following we detail the changes required to adapt the examples to the new versions of Xtext.

PLEASE, make sure to read all the required changes in the reverse order, e.g., first apply the changes from Xtext 2.10.0 to Xtext 2.11.0, then the changes from Xtext 2.11.0 to Xtext 2.12.0, etc.

## Xtext 2.19.0

MWE2 should be updated to 2.11.0, in the POM files and in the target platforms.

### Xbase

Xbase projects should update the version range of `org.objectweb.asm` in the `MANIFEST.MF` files that already require that bundle: `[7.1.0,7.2.0)`.

## Xtext 2.18.0

No critical change is required. Here we list only a few changes that might be required.

### Maven build

The `pom.xml` used in the main project for running MWE2 during the Maven build could be updated by chaging the version range for `xtext-antlr-generator` to the strict version `2.1.1`:

```XML
<dependency>
	<groupId>org.eclipse.xtext</groupId>
	<artifactId>xtext-antlr-generator</artifactId>
	<version>2.1.1</version>
</dependency>
```

### Xbase

The Xbase compiler has been slightly changed by generating parenthesis around a few expressions.  The compilation tests will have to be adapted, in case you were comparing the result of the compilation with an expected result.

For example, instead of Java code of the shape

```Java
while ((!args[i].isEmpty())) {
```

The Xbase compiler now generates:

```Java
while ((!(args[i]).isEmpty())) {
```

## Xtext 2.17.0 and Eclipse 2019-03

Support for x86 architectures have been removed. In the parent POMs you must make sure you only have configurations for `x86_64`.

Xtext has introduced support for Java 9 and later, including Java 11.

For example, for running tests with Java 9 or later, you need to pass this command line argument to tycho.surefire `--add-modules=ALL-SYSTEM`.

The POMs of the examples have been updated. The Xtext 2.17 project wizard already generates the correct configurations in the POMs. Either you look at the POMs of the examples (in particular the self-contained `org.example.hellomaven.parent` project)
or you generate a brand new set of projects and draw inspiration from there.

Due to a problem with `javax.annotation` when using Java 11
(see https://github.com/eclipse/xtext-core/pull/934 and https://bugs.eclipse.org/bugs/show_bug.cgi?id=539038) until Tycho 1.4.0 is released (which fixes this problem), in the `.tests` project (not the `.ui.tests`) this additional configuration must be specified:

```xml
<plugin>
	<groupId>org.eclipse.tycho</groupId>
	<artifactId>target-platform-configuration</artifactId>
	<configuration>
		<dependency-resolution>
			<extraRequirements>
				<!-- Required in Java 11 See https://bugs.eclipse.org/bugs/show_bug.cgi?id=539038 
					https://github.com/eclipse/xtext-core/pull/934 -->
				<requirement>
					<type>eclipse-feature</type>
					<id>org.eclipse.rcp</id>
					<versionRange>0.0.0</versionRange>
				</requirement>
			</extraRequirements>
		</dependency-resolution>
	</configuration>
</plugin>
```

The Xtext 2.17 project wizard already generates this configuration in the POM of the `.tests` project. You have to manually add it only in your existing POMs. The POMs of the examples of the book have already been updated.

## Xtext 2.13.0

The `plugin.xml_gen`, after regeneration, will contain additional parts, so make sure you merge such parts with the `plugin.xml` in the UI projects.

The version of Maven artifact `org.eclipse.emf.mwe2.launch` must now be `2.9.1.201705291010`.

## Xtext 2.12.0

### UI Testing

The UI related classes from the bundle `org.eclipse.xtext.junit4` and `org.eclipse.xtext.xbase.junit` have been deprecated: you should now use `org.eclipse.xtext.ui.testing` and `org.eclipse.xtext.xbase.ui.testing`, which basically provide the same classes, but with with the package `org.eclipse.xtext.ui.testing` and `org.eclipse.xtext.xbase.ui.testing`, respectively (see <https://github.com/eclipse/xtext-eclipse/issues/156>).

So, in your `ui.tests` projects where you get deprecation warnings, please make sure to add the two above mentioned bundles as requirements in the `MANIFEST.MF` and manually modify your test cases so that they import and use the new packages (once you removed the deprecated imports, use "Organize Imports" and make sure you select the new classes).

## Xtext 2.11.0

Besides the changes shown in this section, you may also want to have a look at the [full release notes of Xtext 2.11.0](https://eclipse.org/Xtext/releasenotes.html#/releasenotes/2017/02/01/version-2-11-0).

### IntelliJ support (ATTENTION)

The IntelliJ IDEA integration of Xtext is currently lacking contributors. Therefore, unfortunately, the IDEA support has **not** been part of the 2.11 release.  If you want to try Xtext support for IntelliJ you need to stick with Xtext 2.10.0.

The sources of the example `helloidea` shown in the book will **not** be automatically imported in the workspace, if you use the automatic procedure shown in [GETTINGSOURCES](GETTINGSOURCES.md).

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

The non-UI related classes from the bundle `org.eclipse.xtext.junit4` have been deprecated: you should now use `org.eclipse.xtext.testing`, which basically provides the same classes, but with with the package `org.eclipse.xtext.testing` instead of `org.eclipse.xtext.junit4`.  The same holds for non-UI related classes in `org.eclipse.xtext.xbase.junit`, you should now use the ones from `org.eclipse.xtext.xbase.testing`.
 
Running the mwe2 generator will add the new bundles as dependencies.  Moreover, the generated injector providers for tests are based on the new bundles and packages (you will get lots of errors in that respect), so you will need to manually modify your test cases so that they import and use the new packages (once you removed the deprecated imports, use "Organize Imports" and make sure you select the new classes).

`org.eclipse.xtext.xbase.junit.formatter.FormatterTester` must be replaced with `org.eclipse.xtext.testing.formatter.FormatterTestHelper`.

Similar adaptations will have to be performed also in the `.ui.tests` project concerning the injector providers.  However, for UI tests, `org.eclipse.xtext.junit4` and `org.eclipse.xtext.xbase.junit` are still required, since not all the testing classes have been ported to the new bundles (see <https://github.com/eclipse/xtext-eclipse/issues/156>).

### Xtend warnings

Xtend now has a warning of the shape `The operator '!=' should be replaced by '!==' when null is one of the arguments.`, the same holds for `==` and `===`, suggesting to use actual reference equality check instead of '!=' or `==` (which in Xtend is translated into a call of `equals` method).

### Xbase

The Xbase compiler has been optimized in order to reduce the numbers of additional synthetic variables that are generated.  The compilation tests will have to be adapted, in case you were comparing the result of the compilation with an expected result.

For example, instead of Java code of the shape

```Java
Integer _get = a.get(_plusPlus);
InputOutput.<Integer>println(_get);
```

The Xbase compiler now generates:

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

### IDE Guice Module

The 2.11 release introduces a new IDE Guice module hierarchy, which is used for generic editor and IDE features (including the web editor).  If you already have an `.ide` project, running mwe2 will generate a few Xtend classes in the `src` folder (and, consequently, some generated Java classes in the `xtend-gen` folder).  Make sure that both `src` and `xtend-gen` are configured as source folders in the existing `.ide` project.

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
