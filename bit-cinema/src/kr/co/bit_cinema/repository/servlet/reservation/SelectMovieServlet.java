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

@WebServlet("/reservation/selectMovie")
public class SelectMovieServlet extends HttpServlet{

	SqlSession session;
	ReservationMapper mapper;
	
	public SelectMovieServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> list = null;
		
		try {
			list = mapper.selectMovie();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("test!!!!!!!!!!!!!");
		System.out.println(list);
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectMovie.jsp");
		rd.forward(request, response);
		
	}
	
}
