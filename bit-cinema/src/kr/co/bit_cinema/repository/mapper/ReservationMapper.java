package kr.co.bit_cinema.repository.mapper;

import java.util.List;

public interface ReservationMapper {
	public List<String> selectMovieOrderByName() throws Exception;
	public List<String> selectMovieOrderByReservation() throws Exception;
	
	
}
