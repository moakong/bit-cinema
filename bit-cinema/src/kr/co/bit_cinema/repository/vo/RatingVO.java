package kr.co.bit_cinema.repository.vo;

import java.util.Date;

public class RatingVO {
	
	
	
	
	private int ratingNo;
	
	private String memberId;
	private String nickname;
	
	
	private int movieId;
	
	private String content;
	private int rating;
	private int spoiler;
	
	private Date regDate;

	public int getRatingNo() {
		return ratingNo;
	}

	public void setRatingNo(int ratingNo) {
		this.ratingNo = ratingNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getSpoiler() {
		return spoiler;
	}

	public void setSpoiler(int spoiler) {
		this.spoiler = spoiler;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
