package kr.or.knowDrug.durSearch.vo;

public class DurSearchVO {
	private int searchSeq;
	private String memId;
	private String itemName; //제품명
	private String ingredientName; //성분명
	private String entpName; //회사명
	private String efficacy; //효능효과
	private String route; //투여경로
	private String formName; //제형
	private String recognizeName; //식별문자
	private String durShape; //모양
	private String durColor; //색상
	private String durLine; //분할선
	private String durClassify; //약효분류
	private String inUserId; //등록자
	private String inDate; //등록일
	private String upUserId; //수정자
	private String upDate;  //수정일

	public DurSearchVO() {}

	public DurSearchVO(int searchSeq, String memId, String itemName, String ingredientName, String entpName,
			String efficacy, String route, String formName, String recognizeName, String durShape, String durColor,
			String durLine, String durClassify, String inUserId, String inDate, String upUserId, String upDate) {
		super();
		this.searchSeq = searchSeq;
		this.memId = memId;
		this.itemName = itemName;
		this.ingredientName = ingredientName;
		this.entpName = entpName;
		this.efficacy = efficacy;
		this.route = route;
		this.formName = formName;
		this.recognizeName = recognizeName;
		this.durShape = durShape;
		this.durColor = durColor;
		this.durLine = durLine;
		this.durClassify = durClassify;
		this.inUserId = inUserId;
		this.inDate = inDate;
		this.upUserId = upUserId;
		this.upDate = upDate;
	}




	public int getSearchSeq() {
		return searchSeq;
	}
	public void setSearchSeq(int searchSeq) {
		this.searchSeq = searchSeq;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getIngredientName() {
		return ingredientName;
	}
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	public String getEntpName() {
		return entpName;
	}
	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}
	public String getEfficacy() {
		return efficacy;
	}
	public void setEfficacy(String efficacy) {
		this.efficacy = efficacy;
	}
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getRecognizeName() {
		return recognizeName;
	}
	public void setRecognizeName(String recognizeName) {
		this.recognizeName = recognizeName;
	}
	public String getDurShape() {
		return durShape;
	}
	public void setDurShape(String durShape) {
		this.durShape = durShape;
	}
	public String getDurColor() {
		return durColor;
	}
	public void setDurColor(String durColor) {
		this.durColor = durColor;
	}
	public String getDurLine() {
		return durLine;
	}
	public void setDurLine(String durLine) {
		this.durLine = durLine;
	}
	public String getDurClassify() {
		return durClassify;
	}
	public void setDurClassify(String durClassify) {
		this.durClassify = durClassify;
	}
	public String getInUserId() {
		return inUserId;
	}
	public void setInUserId(String inUserId) {
		this.inUserId = inUserId;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	public String getUpUserId() {
		return upUserId;
	}
	public void setUpUserId(String upUserId) {
		this.upUserId = upUserId;
	}
	public String getUpDate() {
		return upDate;
	}
	public void setUpDate(String upDate) {
		this.upDate = upDate;
	}




}
