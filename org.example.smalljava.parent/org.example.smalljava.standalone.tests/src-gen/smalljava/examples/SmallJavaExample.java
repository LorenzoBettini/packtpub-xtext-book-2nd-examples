package smalljava.examples;

public class SmallJavaExample {
	public smalljava.examples.SmallJavaExample m() {
		return new smalljava.examples.SmallJavaExample();
	}
	public String sayHello1() {
		return new smalljava.examples2.AnotherSmallJavaExample().hello(true);
	}
	public String sayHello2() {
		return new smalljava.examples2.AnotherSmallJavaExample().hello(false);
	}
}
