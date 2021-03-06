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

@WebServlet("/reservation/selectArea")
public class SelectAreaServlet extends HttpServlet {
	
	SqlSession session;
	ReservationMapper mapper;
	
	public SelectAreaServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		System.out.println("movieID : " + movieId); // 확인용
		
		
		List<TheaterVO> list = null;
		
		try {
			list = mapper.selectArea(movieId); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String data = new Gson().toJson(list);
		System.out.println("!!!지역test!!!");
		System.out.println(data);// 콘솔 확인용


		// 안해주면 json내용을 println을 통해웹으로 보낼 때 한글 깨짐
		response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println(data); 
		out.close();
		
		
	}

	
}





