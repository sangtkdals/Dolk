package dolk.bean;

public class DrugBean {
	
	private int did;
	private String dname;
	private String manufacture;
	private String description;
	private String dimg;
	
	public int getId() {
		return did;
	}
	public void setId(int did) {
		this.did = did;
	}
	public String getName() {
		return dname;
	}
	public void setName(String dname) {
		this.dname = dname;
	}
	public String getManufacture() {
		return manufacture;
	}
	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImg() {
		return dimg;
	}
	public void setImg(String dimg) {
		this.dimg = dimg;
	}
}
