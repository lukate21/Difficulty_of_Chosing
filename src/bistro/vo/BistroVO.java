package bistro.vo;

public class BistroVO {
	private String bName;
	private String fName;
	private int price;
	private String addr;	
	private String tel;
	private int tScore;	
	private int reviewCnt;
	
	public BistroVO() {
	}

	public BistroVO(String bName, String fName, int price, String addr, String tel, int tScore, int reviewCnt) {
		this.bName = bName;
		this.fName = fName;
		this.price = price;
		this.addr = addr;
		this.tel = tel;
		this.tScore = tScore;
		this.reviewCnt = reviewCnt;
	}

	public int gettScore() {
		return tScore;
	}

	public void settScore(int tScore) {
		this.tScore = tScore;
	}

	public int getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "BistroVO [bName=" + bName + ", fName=" + fName + ", price=" + price + ", addr=" + addr + ", tel=" + tel
				+ ", tScore=" + tScore + ", reviewCnt=" + reviewCnt + "]";
	}

}
