package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.ReservationMapper;

@WebServlet("/reservation/check")
public class CheckReservationsServlet extends HttpServlet {
	SqlSession session;
	ReservationMapper mapper;
	
	public CheckReservationsServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
//		request.setAttribute("rInfo", rInfo);
//		request.setAttribute("sList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/checkReservation.jsp");
		rd.forward(request, response);
	}
	
		
}
















