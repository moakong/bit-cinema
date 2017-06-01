package kr.co.bit_cinema.repository.vo;

import java.util.Date;

public class MovieVO {
	private int movieId;
	private String movieName;
	private Date releaseDate;
	private String runtime;
	private String genre;
	private String certificate;
	private String storyline;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getStoryline() {
		return storyline;
	}
	public void setStoryline(String storyline) {
		this.storyline = storyline;
	}
	
}
