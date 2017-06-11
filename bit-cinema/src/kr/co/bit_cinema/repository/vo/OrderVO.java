package kr.co.bit_cinema.repository.vo;

import java.sql.Date;

public class OrderVO {	
	private String name;
	private String img;
	private int orderId;
	private String snackId;
	private Date limitDate;
	private int count;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getSnackId() {
		return snackId;
	}
	public void setSnackId(String snackId) {
		this.snackId = snackId;
	}
	public Date getLimitDate() {
		return limitDate;
	}
	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
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
	
}
