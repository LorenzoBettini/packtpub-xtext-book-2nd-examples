package entities;

public class MyBaseEntity {
	private MyEntity[] arrayAttr;
	private MyEntity[] arrayAttrWithDimension;
	private MyEntity notArrayAttr;
	private String stringAttr;
	private boolean booleanAttr;
	private int[] intArrayAttr;

	public MyEntity[] getArrayAttr() {
		return arrayAttr;
	}
	
	public void setArrayAttr(MyEntity[] _arg) {
		this.arrayAttr = _arg;
	}
	
	public MyEntity[] getArrayAttrWithDimension() {
		return arrayAttrWithDimension;
	}
	
	public void setArrayAttrWithDimension(MyEntity[] _arg) {
		this.arrayAttrWithDimension = _arg;
	}
	
	public MyEntity getNotArrayAttr() {
		return notArrayAttr;
	}
	
	public void setNotArrayAttr(MyEntity _arg) {
		this.notArrayAttr = _arg;
	}
	
	public String getStringAttr() {
		return stringAttr;
	}
	
	public void setStringAttr(String _arg) {
		this.stringAttr = _arg;
	}
	
	public boolean getBooleanAttr() {
		return booleanAttr;
	}
	
	public void setBooleanAttr(boolean _arg) {
		this.booleanAttr = _arg;
	}
	
	public int[] getIntArrayAttr() {
		return intArrayAttr;
	}
	
	public void setIntArrayAttr(int[] _arg) {
		this.intArrayAttr = _arg;
	}
	
}
