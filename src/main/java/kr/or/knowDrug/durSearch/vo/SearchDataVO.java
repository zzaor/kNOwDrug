package kr.or.knowDrug.durSearch.vo;

public class SearchDataVO {

	private String itemName;
	private String itemImage;
	private String printFront;
	private String entpName;
	private String drugShape;
	private String drugForm;
	private String lengLong;
	private String lengShort;
	private String thick;
	private String inUserId;
	private String inDate;
	private String upUserId;
	private String upDate;
	private String printBack;
	private String itemColor;


	public SearchDataVO(String itemName, String itemImage, String printFront, String entpName, String drugShape,
			String drugForm, String lengLong, String lengShort, String thick, String inUserId, String inDate,
			String upUserId, String upDate, String printBack, String itemColor) {
		super();
		this.itemName = itemName;
		this.itemImage = itemImage;
		this.printFront = printFront;
		this.entpName = entpName;
		this.drugShape = drugShape;
		this.drugForm = drugForm;
		this.lengLong = lengLong;
		this.lengShort = lengShort;
		this.thick = thick;
		this.inUserId = inUserId;
		this.inDate = inDate;
		this.upUserId = upUserId;
		this.upDate = upDate;
		this.printBack = printBack;
		this.itemColor = itemColor;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getItemImage() {
		return itemImage;
	}


	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}


	public String getPrintFront() {
		return printFront;
	}


	public void setPrintFront(String printFront) {
		this.printFront = printFront;
	}


	public String getEntpName() {
		return entpName;
	}


	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}


	public String getDrugShape() {
		return drugShape;
	}


	public void setDrugShape(String drugShape) {
		this.drugShape = drugShape;
	}


	public String getDrugForm() {
		return drugForm;
	}


	public void setDrugForm(String drugForm) {
		this.drugForm = drugForm;
	}


	public String getLengLong() {
		return lengLong;
	}


	public void setLengLong(String lengLong) {
		this.lengLong = lengLong;
	}


	public String getLengShort() {
		return lengShort;
	}


	public void setLengShort(String lengShort) {
		this.lengShort = lengShort;
	}


	public String getThick() {
		return thick;
	}


	public void setThick(String thick) {
		this.thick = thick;
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


	public String getPrintBack() {
		return printBack;
	}


	public void setPrintBack(String printBack) {
		this.printBack = printBack;
	}


	public String getItemColor() {
		return itemColor;
	}


	public void setItemColor(String itemColor) {
		this.itemColor = itemColor;
	}





}
