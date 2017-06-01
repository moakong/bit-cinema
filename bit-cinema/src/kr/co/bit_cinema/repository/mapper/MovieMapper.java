package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.ActorVO;
import kr.co.bit_cinema.repository.vo.DirectorVO;
import kr.co.bit_cinema.repository.vo.MediaVO;
import kr.co.bit_cinema.repository.vo.MovieVO;

public interface MovieMapper {
	public MovieVO infoMovie(int movieId) throws Exception;
	public List<MovieVO> boxMovie() throws Exception;
	public List<MovieVO> reserMovie() throws Exception;
	public List<DirectorVO> selectDirector(int movieId) throws Exception;
	public List<ActorVO> selectActor(int movieId) throws Exception;
	public List<MediaVO> selectMedia(int movieId) throws Exception;
}
