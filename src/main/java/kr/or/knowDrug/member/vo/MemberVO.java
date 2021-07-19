package kr.or.knowDrug.member.vo;

public class MemberVO {
	private String memId;
	private String memPwd;
	private String memName;
	private String memBirth;
	private String memTel;
	private int memZip;
	private String memAddr1;
	private String memAddr2;
	private String inDate;
	private String activeYn;

	public MemberVO() {}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public int getMemZip() {
		return memZip;
	}

	public void setMemZip(int memZip) {
		this.memZip = memZip;
	}

	public String getMemAddr1() {
		return memAddr1;
	}

	public void setMemAddr1(String memAddr1) {
		this.memAddr1 = memAddr1;
	}

	public String getMemAddr2() {
		return memAddr2;
	}

	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}

	public String getInDate() {
		return inDate;
	}

	public void setInDate(String inDate) {
		this.inDate = inDate;
	}

	public String getActiveYn() {
		return activeYn;
	}

	public void setActiveYn(String activeYn) {
		this.activeYn = activeYn;
	}

	public MemberVO(String memId, String memPwd, String memName, String memBirth, String memTel, int memZip,
			String memAddr1, String memAddr2, String inDate, String activeYn) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memTel = memTel;
		this.memZip = memZip;
		this.memAddr1 = memAddr1;
		this.memAddr2 = memAddr2;
		this.inDate = inDate;
		this.activeYn = activeYn;
	}



}
