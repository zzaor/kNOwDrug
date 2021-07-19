package kr.or.knowDrug.board.vo;

public class BoardVO {
	private int boardSeq;
	private String memId;
	private String memName;
	private String boardTitle;
	private String boardContent;
	private String attachFile;
	private String attachPath;
	private int boardHit;
	private String inDate ;
	private String inUserId;
	private String upDate ;
	private String upUserId;

	public BoardVO() {}

	public BoardVO(int boardSeq, String memId, String memName, String boardTitle, String boardContent,
			String attachFile, String attachPath, int boardHit, String inDate, String inUserId, String upDate,
			String upUserId) {
		this.boardSeq = boardSeq;
		this.memId = memId;
		this.memName = memName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.attachFile = attachFile;
		this.attachPath = attachPath;
		this.boardHit = boardHit;
		this.inDate = inDate;
		this.inUserId = inUserId;
		this.upDate = upDate;
		this.upUserId = upUserId;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
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
