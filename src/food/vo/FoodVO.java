package food.vo;

public class FoodVO {
	private String fName;	
	private String fId;

	public FoodVO() {
	}

	public FoodVO(String fName, String fId) {
		this.fName = fName;
		this.fId = fId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfId() {
		return fId;
	}

	public void setfId(String fId) {
		this.fId = fId;
	}

	@Override
	public String toString() {
		return "FoodVO [fName=" + fName + ", fId=" + fId + "]";
	}
	
}
