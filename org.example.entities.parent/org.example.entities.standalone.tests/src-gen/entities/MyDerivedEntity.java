package entities;

public class MyDerivedEntity extends MyBaseEntity {
	private MyEntity attribute;

	public MyEntity getAttribute() {
		return attribute;
	}
	
	public void setAttribute(MyEntity _arg) {
		this.attribute = _arg;
	}
	
}
