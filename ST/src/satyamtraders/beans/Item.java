package satyamtraders.beans;

public class Item {
	private int itemId;
	private String itemName;
	private int quantity;
	private float mrp;
	private float vatPer;
	private float retMarPer;
	private float purchasePrice;
	private float salePrice;

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getMrp() {
		return mrp;
	}

	public void setMrp(float mrp) {
		this.mrp = mrp;
	}

	public float getVatPer() {
		return vatPer;
	}

	public void setVatPer(float vatPer) {
		this.vatPer = vatPer;
	}

	public float getRetMarPer() {
		return retMarPer;
	}

	public void setRetMarPer(float retMarPer) {
		this.retMarPer = retMarPer;
	}

	public float getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(float purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public Item(int id, String itemName) {
		super();
		this.itemName = itemName;
		this.setItemId(id);
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public float getItemPrice() {
		return (salePrice*100)/(100+vatPer);
	}

	public float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}
}
