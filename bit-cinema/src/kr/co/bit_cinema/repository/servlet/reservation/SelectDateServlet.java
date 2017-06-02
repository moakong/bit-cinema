package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
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


@WebServlet("/reservation/selectDate")
public class SelectDateServlet extends HttpServlet {
	SqlSession session;
	ReservationMapper mapper;
	
	public SelectDateServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Calendar c = Calendar.getInstance();
	
//		List<Integer> monthList = new ArrayList<>();
//		List<Integer> dayList = new ArrayList<>();
//		
//		monthList.add(c.get(Calendar.MONTH) + 1);
//		dayList.add(c.get(Calendar.DATE));
//		
//		
//		for(int i = 0; i < 6; i++) { 
//			c.add(Calendar.DATE, 1);
//			
//			monthList.add(c.get(Calendar.MONTH) + 1);
//			dayList.add(c.get(Calendar.DATE));
//		}
		
		List<String> dayList = new ArrayList<>();
		dayList.add((c.get(Calendar.MONTH) + 1) + " / " + c.get(Calendar.DATE));
		
		for(int i = 0; i < 6; i++) { 
			c.add(Calendar.DATE, 1);
			
			dayList.add((c.get(Calendar.MONTH) + 1) + " /  " + c.get(Calendar.DATE));
		}
		
		
		request.setAttribute("theaterId", request.getParameter("theaterId"));
		request.setAttribute("movieId", request.getParameter("movieId"));
//		request.setAttribute("monthList", monthList);
		request.setAttribute("year", c.get(Calendar.YEAR));
		request.setAttribute("dayList", dayList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectDate.jsp");
		rd.forward(request, response);
		
	}
	
	

}
