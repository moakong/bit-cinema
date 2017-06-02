package kr.co.bit_cinema.repository.vo;

import java.util.Date;

public class ReviewVO {
	
	private int reviewNo; /* 리뷰 번호 */
	private String title; 	 /* 제목 */
	private String content;	  /* 내용 */
	private Date regDate ;	 /* 등록일 */
	private int	spoiler;  	 /* 스포 */
	private int	readCount;	  /* 조회수 */
	private int recomCount; 	 /* 추천수 */
	private String memberId; 	 /* 회원ID */
	private int movieId; 	 /* 영화번호 */
	private String nickname; 	 /* 회원정보 별명 */
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getSpoiler() {
		return spoiler;
	}
	public void setSpoiler(int spoiler) {
		this.spoiler = spoiler;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getRecomCount() {
		return recomCount;
	}
	public void setRecomCount(int recomCount) {
		this.recomCount = recomCount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}



}     
            	