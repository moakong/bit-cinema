package kr.co.bit_cinema.repository.vo;

public class SnackVO {
	private int snackId;
	private String name;
	private String img;
	private int price;
	private String explan;
	private int categoryId;
	public int getSnackId() {
		return snackId;
	}
	public void setSnackId(int snackId) {
		this.snackId = snackId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExplan() {
		return explan;
	}
	public void setExplan(String explan) {
		this.explan = explan;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
}
