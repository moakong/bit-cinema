package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.ReservationMapper;

@WebServlet("/reservation/selectTime")
public class SelectTimeServlet extends HttpServlet {

	SqlSession session;
	ReservationMapper mapper;
	
	public SelectTimeServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		
		// 아래 두 개는 넘어오게 처리 안함
		int theaterId = Integer.parseInt(request.getParameter("theaterId"));
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
		
		try {
			Date d = sdf.parse(date); // 문자형식으로 넘어온 날짜 Date형식으로 형변환
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
	}
	
}
