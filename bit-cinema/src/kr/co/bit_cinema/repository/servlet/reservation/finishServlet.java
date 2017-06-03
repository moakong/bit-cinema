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

@WebServlet("/reservation/finish")
public class finishServlet extends HttpServlet {

	SqlSession session;
	ReservationMapper mapper;
	
	public finishServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		
		// 예약 정보 가져오기 쿼리를 데이터 받고, jsp에 넘기는 프로세스 필요
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/finish.jsp");
		rd.forward(request, response);
	}
	
}











