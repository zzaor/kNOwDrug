package kr.or.knowDrug.board.vo;

public class ReplyVO {
	private int replySeq;
	private int boardSeq;
	private String replyName;
	private String replyPwd;
	private String replyContent;
	private String inDate;
	private String inUserId;
	private String upDate;
	private String upUserId;

	public ReplyVO() {}

	public ReplyVO(int replySeq, int boardSeq, String replyName, String replyPwd, String replyContent, String inDate,
			String inUserId, String upDate, String upUserId) {
		this.replySeq = replySeq;
		this.boardSeq = boardSeq;
		this.replyName = replyName;
		this.replyPwd = replyPwd;
		this.replyContent = replyContent;
		this.inDate = inDate;
		this.inUserId = inUserId;
		this.upDate = upDate;
		this.upUserId = upUserId;
	}

	public int getReplySeq() {
		return replySeq;
	}

	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getReplyName() {
		return replyName;
	}

	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}

	public String getReplyPwd() {
		return replyPwd;
	}

	public void setReplyPwd(String replyPwd) {
		this.replyPwd = replyPwd;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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
