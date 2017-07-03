package review.vo;

public class ReviewVO {
	private String bName;
	private String mId;
	private String content;
	private double score;	
	private String regDate;
	private int no;
	

	public ReviewVO(String bName, String mId, String content, double score, String regDate, int no) {
		super();
		this.bName = bName;
		this.mId = mId;
		this.content = content;
		this.score = score;
		this.regDate = regDate;
		this.no = no;
	}

	public ReviewVO() {
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ReviewVO [bName=" + bName + ", mId=" + mId + ", content=" + content + ", score=" + score + ", regDate="
				+ regDate + ", no=" + no + "]";
	}


	
}
