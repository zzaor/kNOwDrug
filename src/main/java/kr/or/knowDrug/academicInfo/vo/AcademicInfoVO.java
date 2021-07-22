package kr.or.knowDrug.academicInfo.vo;

public class AcademicInfoVO {
	private int academicSeq;
	private String memId;
	private String academicTitle;
	private int fileSeq;
	private String attachFile;
	private String attachPath;
	private String academicHit;
	private String inDate;
	private String inUserId;
	private String upDate;
	private String upUserId;

	public AcademicInfoVO() {}

	public AcademicInfoVO(int academicSeq, String memId, String academicTitle, int fileSeq, String attachFile, String attachPath,
			String academicHit, String inDate, String inUserId, String upDate, String upUserId) {
		super();
		this.academicSeq = academicSeq;
		this.memId = memId;
		this.academicTitle = academicTitle;
		this.fileSeq = fileSeq;
		this.attachFile = attachFile;
		this.attachPath = attachPath;
		this.academicHit = academicHit;
		this.inDate = inDate;
		this.inUserId = inUserId;
		this.upDate = upDate;
		this.upUserId = upUserId;
	}

	@Override
	public String toString() {
		return "AcademicInfoVO [academicSeq=" + academicSeq + ", memId=" + memId + ", academicTitle=" + academicTitle
				+ ", fileSeq=" + fileSeq + ", attachFile=" + attachFile + ", attachPath=" + attachPath
				+ ", academicHit=" + academicHit + ", inDate=" + inDate + ", inUserId=" + inUserId + ", upDate="
				+ upDate + ", upUserId=" + upUserId + "]";
	}


	public int getAcademicSeq() {
		return academicSeq;
	}

	public void setAcademicSeq(int academicSeq) {
		this.academicSeq = academicSeq;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getAcademicTitle() {
		return academicTitle;
	}

	public void setAcademicTitle(String academicTitle) {
		this.academicTitle = academicTitle;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}

	public String getAttachPath() {
		return attachPath;
	}

	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}

	public String getAcademicHit() {
		return academicHit;
	}

	public void setAcademicHit(String academicHit) {
		this.academicHit = academicHit;
	}

	public String getInDate() {
		return inDate;
	}

	public void setInDate(String inDate) {
		this.inDate = inDate;
	}

	public String getInUserId() {
		return inUserId;
	}

	public void setInUserId(String inUserId) {
		this.inUserId = inUserId;
	}

	public String getUpDate() {
		return upDate;
	}

	public void setUpDate(String upDate) {
		this.upDate = upDate;
	}

	public String getUpUserId() {
		return upUserId;
	}

	public void setUpUserId(String upUserId) {
		this.upUserId = upUserId;
	}





}
