package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.ReservationMapper;
import kr.co.bit_cinema.repository.vo.reservation.SeatVO;

@WebServlet("/reservation/selectSeat")
public class selectSeatServlet extends HttpServlet {

	SqlSession session;
	ReservationMapper mapper;
	
	public selectSeatServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	
	
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int schNo =  Integer.parseInt(request.getParameter("schNo"));
		int people =  Integer.parseInt(request.getParameter("people"));

		
		List<SeatVO> all = null;
		List<SeatVO> reserved = null;
		try {
			all = mapper.selectAllSeat(schNo);
			reserved = mapper.selectReservedSeat(schNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		////////////////////
		System.out.println("예약된 좌석 가져오기 테스트!!");
		for(SeatVO s : reserved){
			System.out.println(s.getSeatId());
		}
		///////////////////

		request.setAttribute("schNo", schNo);
		request.setAttribute("people", people);
		
		request.setAttribute("all", all);
		request.setAttribute("reserved", reserved);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectSeat.jsp");
		rd.forward(request, response);
		
	}
	
	
	
	
}















