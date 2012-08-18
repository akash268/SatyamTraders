package satyamtraders.beans;

public class Supplier {
	private String name;
	private long id;
	public Supplier(String name, long id) {
		super();
		this.name = name;
		this.id = id;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
