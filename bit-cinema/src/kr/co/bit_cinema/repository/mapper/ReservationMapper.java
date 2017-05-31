package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.reservation.TheaterVO;

public interface ReservationMapper {
	public List<String> selectMovieOrderByName() throws Exception;
	public List<String> selectMovieOrderByReservation() throws Exception;
	public List<TheaterVO> selectArea(int movieId) throws Exception;
	
	
}
