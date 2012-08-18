package satyamtraders.beans;
public class Vat {
	
	private float vatPercentage;
	private String vatDesc;
	public float getVatPercentage() {
		return vatPercentage;
	}
	public void setVatPercentage(float vatPercentage) {
		this.vatPercentage = vatPercentage;
	}
	public String getVatDesc() {
		return vatDesc;
	}
	public void setVatDesc(String vatDesc) {
		this.vatDesc = vatDesc;
	}
	public Vat(float vatPercentage, String vatDesc) {
		super();
		this.vatPercentage = vatPercentage;
		this.vatDesc = vatDesc;
	}
}
