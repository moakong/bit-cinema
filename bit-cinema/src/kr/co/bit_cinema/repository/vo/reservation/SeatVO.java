package kr.co.bit_cinema.repository.vo.reservation;

public class SeatVO {
	private int seatId;
	private int r;
	private int c;
	private int turn;
	private int totalR;
	private int totalC;
	
	
	
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public int getTotalR() {
		return totalR;
	}
	public void setTotalR(int totalR) {
		this.totalR = totalR;
	}
	public int getTotalC() {
		return totalC;
	}
	public void setTotalC(int totalC) {
		this.totalC = totalC;
	}
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}



	


}
