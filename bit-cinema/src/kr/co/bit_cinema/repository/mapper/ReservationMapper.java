package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.reservation.SchduleVO;
import kr.co.bit_cinema.repository.vo.reservation.TheaterVO;

public interface ReservationMapper {
	public List<SchduleVO> selectMovieOrderByName() throws Exception;
	public List<SchduleVO> selectMovieOrderByReservation() throws Exception;
	public List<TheaterVO> selectArea(int movieId) throws Exception;
	public List<TheaterVO> selectTheater(TheaterVO t) throws Exception;
	public List<SchduleVO> selectTime(SchduleVO s) throws Exception;
	
	
}
