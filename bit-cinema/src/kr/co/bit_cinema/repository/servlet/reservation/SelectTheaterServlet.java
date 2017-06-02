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
		//System.out.println(Integer.parseInt(request.getParameter("movieId"))); // test!!
		
		TheaterVO t = new TheaterVO();
		t.setLocationId(Integer.parseInt(request.getParameter("area")));
		t.setMovieId(Integer.parseInt(request.getParameter("movieId")));
		
		List<TheaterVO> list = null;
		try {
			list = mapper.selectTheater(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 테스트
		for(TheaterVO tt : list) {
			System.out.println(tt.getTheaterName());
			System.out.println("극장 이름 테스트===");
			
		}
		
		
		request.setAttribute("movieId", request.getParameter("movieId"));
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectTheater.jsp");
		rd.forward(request, response);
		
		
	}
	
	
}















