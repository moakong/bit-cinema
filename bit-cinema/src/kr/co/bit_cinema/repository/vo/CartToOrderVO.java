package kr.co.bit_cinema.repository.vo;

public class CartToOrderVO {
	private int snackId;
	private String name;
	private int price;
	private int count;
	private int amount;
	private String img;
	
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
