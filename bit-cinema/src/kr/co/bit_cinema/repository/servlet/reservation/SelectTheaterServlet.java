package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.ReservationMapper;
import kr.co.bit_cinema.repository.vo.reservation.TheaterVO;

@WebServlet("/reservation/selectTheater")
public class SelectTheaterServlet extends HttpServlet {
	
	SqlSession session;
	ReservationMapper mapper;
	
	public SelectTheaterServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// reservation/selectTheater?area=2
		System.out.println("movieId : " + Integer.parseInt(request.getParameter("movieId"))); // test!!
		System.out.println("area : " + Integer.parseInt(request.getParameter("area"))); // test!!
		
		TheaterVO t = new TheaterVO();
		t.setLocationId(Integer.parseInt(request.getParameter("area")));
		t.setMovieId(Integer.parseInt(request.getParameter("movieId")));
		
		List<TheaterVO> list = null;
		try {
			list = mapper.selectTheater(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		String data = new Gson().toJson(list);
		System.out.println("!!!극장test!!!");
		System.out.println(data);// 콘솔 확인용


		response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println(data); 
		out.close();
	}
	
	
}















