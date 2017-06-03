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
		int peoeple =  Integer.parseInt(request.getParameter("peoeple"));

		
		
		
		
		
		request.setAttribute("schNo", schNo);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectSeat.jsp");
		rd.forward(request, response);
		
	}
	
	
	
	
	
	
	
	
	
	
	
}















