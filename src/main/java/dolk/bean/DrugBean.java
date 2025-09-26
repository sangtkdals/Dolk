package dolk.bean;

public class DrugBean {
	
	private int did; // drug_id == d(drug) + @
	private String dname; // drug_name == dname
	private String manufacture;
	private String description;
	private String dimg; // drug_img == dimg
	
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
