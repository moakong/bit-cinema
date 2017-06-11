package kr.co.bit_cinema.repository.vo.movie;

import java.util.Date;

public class BoxVO {
	private int movieId;
	private int audience;
	private Date audienceDate;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getAudience() {
		return audience;
	}
	public void setAudience(int audience) {
		this.audience = audience;
	}
	public Date getAudienceDate() {
		return audienceDate;
	}
	public void setAudienceDate(Date audienceDate) {
		this.audienceDate = audienceDate;
	}
	
	
}
