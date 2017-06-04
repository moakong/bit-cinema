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
import kr.co.bit_cinema.repository.vo.reservation.ReservationVO;

@WebServlet("/reservation/detail")
public class detatilReservationServlet extends HttpServlet {
	SqlSession session;
	ReservationMapper mapper;
	
	public detatilReservationServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservationId = Integer.parseInt(request.getParameter("reservationId"));
		
		ReservationVO r = null;
		List<ReservationVO> sList = null;
		
		try {
			r = mapper.checkReservationsByNO(reservationId);
			sList = mapper.selectSeatInfo(reservationId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("rInfo", r);
		request.setAttribute("sList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/detailReservation.jsp");
		rd.forward(request, response);
	}
	
}
