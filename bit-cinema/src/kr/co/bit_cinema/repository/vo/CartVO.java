package kr.co.bit_cinema.repository.vo;

public class CartVO {
	private String memberId;
	private int snackId;
	private	int count;
	private String img;
	private String name;
	private int price;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getSnackId() {
		return snackId;
	}
	public void setSnackId(int snackId) {
		this.snackId = snackId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	
}
