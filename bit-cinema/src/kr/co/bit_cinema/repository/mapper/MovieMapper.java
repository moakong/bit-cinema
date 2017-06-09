package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.ActorVO;
import kr.co.bit_cinema.repository.vo.DirectorVO;
import kr.co.bit_cinema.repository.vo.GenreVO;
import kr.co.bit_cinema.repository.vo.MovieVO;
import kr.co.bit_cinema.repository.vo.PhotoVO;
import kr.co.bit_cinema.repository.vo.VideoVO;

public interface MovieMapper {
	public List<MovieVO> selectTitle() throws Exception;
	public void loadMovie(MovieVO movie) throws Exception;
	public void loadGenre(GenreVO genre) throws Exception;
	public void loadThumb(PhotoVO photo) throws Exception;
	
	public MovieVO infoMovie(int movieId) throws Exception;
	public List<String> infoGenre(int movieId) throws Exception;
	public List<MovieVO> boxMovie() throws Exception;
	public List<MovieVO> reserMovie() throws Exception;
	public List<DirectorVO> selectDirector(int movieId) throws Exception;
	public List<ActorVO> selectActor(int movieId) throws Exception;
	public List<VideoVO> selectVideo(int movieId) throws Exception;
	public List<String> selectPhoto(int movieId) throws Exception;
	public String selectThumbnail(int movieId) throws Exception;
}
