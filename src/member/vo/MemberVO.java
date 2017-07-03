package member.vo;

public class MemberVO {
	private String mId;
	private String mName;	
	private String pwd;

	public MemberVO() {
	}

	public MemberVO(String mId, String mName, String pwd) {
		this.mId = mId;
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mName=" + mName + ", pwd=" + pwd + "]";
	}

}
