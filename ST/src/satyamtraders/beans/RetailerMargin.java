package satyamtraders.beans;

public class RetailerMargin {
	private float retailerMargin;
	private String retailerDesc;
	public RetailerMargin(float retailerMargin, String retailerDesc) {
		super();
		this.retailerMargin = retailerMargin;
		this.retailerDesc = retailerDesc;
	}
	public float getRetailerMargin() {
		return retailerMargin;
	}
	public void setRetailerMargin(float retailerMargin) {
		this.retailerMargin = retailerMargin;
	}
	public String getRetailerDesc() {
		return retailerDesc;
	}
	public void setRetailerDesc(String retailerDesc) {
		this.retailerDesc = retailerDesc;
	}
}
