package kr.co.bit_cinema.repository.servlet.movie;

import java.util.List;

class MovieGenre {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}

class Story {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

class OpenInfo {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

class Audience {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

class AudienceDate {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

class Thumbnail {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

class EngTitle {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

class MovieItem{
	private List<MovieGenre> genre;
//	private List<Actor> actor;
	private List<Story> story;
	private List<OpenInfo> open_info;
//	private List<Director> director;
	private List<Thumbnail> thumbnail;
	private List<EngTitle> eng_title;
	private List<Audience> audience;
//	private List<VideoInfo> video_info;
//	private List<video> video;
//	private List<Photo2> photo2;
//	private List<Photo3> photo3;
//	private List<Photo4> photo4;
//	private List<Photo5> photo5;
	private List<AudienceDate> audience_date;
	
	public List<MovieGenre> getGenre() {
		return genre;
	}
	public void setGenre(List<MovieGenre> genre) {
		this.genre = genre;
	}
	public List<Story> getStory() {
		return story;
	}
	public void setStory(List<Story> story) {
		this.story = story;
	}
	public List<OpenInfo> getOpen_info() {
		return open_info;
	}
	public void setOpen_info(List<OpenInfo> open_info) {
		this.open_info = open_info;
	}
	public List<Thumbnail> getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(List<Thumbnail> thumbnail) {
		this.thumbnail = thumbnail;
	}
	public List<EngTitle> getEng_title() {
		return eng_title;
	}
	public void setEng_title(List<EngTitle> eng_title) {
		this.eng_title = eng_title;
	}
	public List<Audience> getAudience() {
		return audience;
	}
	public void setAudience(List<Audience> audience) {
		this.audience = audience;
	}
	public List<AudienceDate> getAudience_date() {
		return audience_date;
	}
	public void setAudience_date(List<AudienceDate> audience_date) {
		this.audience_date = audience_date;
	}

	
	
}

class MovieChannel {
	private List<MovieItem> item;

	public List<MovieItem> getItem() {
		return item;
	}

	public void setItem(List<MovieItem> item) {
		this.item = item;
	}

	
}

public class Movie {
	MovieChannel channel;
	public MovieChannel getChannel() {
		return channel;
	}
	public void setChannel(MovieChannel channel) {
		this.channel = channel;
	}
}
