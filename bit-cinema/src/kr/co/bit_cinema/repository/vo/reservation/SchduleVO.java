package kr.co.bit_cinema.repository.vo.reservation;

import java.util.Date;

public class SchduleVO {
	private int movieId;
	private String movieName;
	private String runtime;
	private int scheduleId;
	private Date startDate;
	private String startTime;
	private String endTime;
	private int rNumbers;
	private int theaterId;
	
	
	public int getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(int theaterId) {
		this.theaterId = theaterId;
	}
	public int getrNumbers() {
		return rNumbers;
	}
	public void setrNumbers(int rNumbers) {
		this.rNumbers = rNumbers;
	}
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
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	
}
