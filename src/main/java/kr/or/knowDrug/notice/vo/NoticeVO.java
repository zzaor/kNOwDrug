package kr.or.knowDrug.notice.vo;

public class NoticeVO {
	private int notiSeq;
	private String memId;
	private String notiTitle;
	private String notiContent;
	private String attachFile;
	private String attachPath;
	private int notiHit;
	private String inDate;
	private String inUserId;
	private String upDate;
	private String upUserId;
	
	@Override
	public String toString() {
		return "NoticeVO [notiSeq=" + notiSeq + ", memId=" + memId + ", notiTitle=" + notiTitle + ", notiContent="
				+ notiContent + ", attachFile=" + attachFile + ", attachPath=" + attachPath + ", notiHit=" + notiHit
				+ ", inDate=" + inDate + ", inUserId=" + inUserId + ", upDate=" + upDate + ", upUserId=" + upUserId
				+ "]";
	}
	
	
	public int getNotiSeq() {
		return notiSeq;
	}
	public void setNotiSeq(int notiSeq) {
		this.notiSeq = notiSeq;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
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
	public int getNotiHit() {
		return notiHit;
	}
	public void setNotiHit(int notiHit) {
		this.notiHit = notiHit;
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
