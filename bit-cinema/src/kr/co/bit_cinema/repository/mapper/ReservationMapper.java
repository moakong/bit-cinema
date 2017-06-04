package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.reservation.ReservationVO;
import kr.co.bit_cinema.repository.vo.reservation.SchduleVO;
import kr.co.bit_cinema.repository.vo.reservation.SeatVO;
import kr.co.bit_cinema.repository.vo.reservation.TheaterVO;

public interface ReservationMapper {
	public List<SchduleVO> selectMovieOrderByName() throws Exception;
	public List<SchduleVO> selectMovieOrderByReservation() throws Exception;
	public List<TheaterVO> selectArea(int movieId) throws Exception;
	public List<TheaterVO> selectTheater(TheaterVO t) throws Exception;
	public List<SchduleVO> selectTime(SchduleVO s) throws Exception;

	
	public List<SeatVO> selectAllSeat(int scheId) throws Exception;
	public List<SeatVO> selectReservedSeat(int scheId) throws Exception;

	
	public void insertReservation(ReservationVO r) throws Exception;
	public void insertReservedSeat(ReservationVO r) throws Exception;

	
	public ReservationVO selectMovieName(int reservationId) throws Exception;
	public ReservationVO selectSchduleInfo(int reservationId) throws Exception;
	public List<ReservationVO> selectSestInfo(int reservationId) throws Exception;

	
	public List<ReservationVO> checkReservations(String memberId) throws Exception;
}
