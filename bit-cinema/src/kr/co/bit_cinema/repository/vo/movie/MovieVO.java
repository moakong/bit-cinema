package kr.co.bit_cinema.repository.vo.movie;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MovieVO {
	private int movieId;
	private String movieName;
	private String engTitle;
	private Date releaseDate;
	private String runtime;
	private String certificate;
	private String story;
	//private List<String> genre = new ArrayList<>();
	
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
	public String getEngTitle() {
		return engTitle;
	}
	public void setEngTitle(String engTitle) {
		this.engTitle = engTitle;
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
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
//	public List<String> getGenre() {
//		return genre;
//	}
//	public void setGenre(List<String> genre) {
//		this.genre = genre;
//	}
//		
}

