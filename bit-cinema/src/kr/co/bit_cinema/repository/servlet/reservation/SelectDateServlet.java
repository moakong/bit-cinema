package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;

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
	
		
		List<String> dayList = new ArrayList<>();
		dayList.add((c.get(Calendar.MONTH) + 1) + " / " + c.get(Calendar.DATE));
		
		for(int i = 0; i < 6; i++) { 
			c.add(Calendar.DATE, 1);
			
			dayList.add((c.get(Calendar.MONTH) + 1) + " / " + c.get(Calendar.DATE));
		}
		
		
		
		
		
		
		String data = new Gson().toJson(dayList);
		System.out.println("!!!극장test!!!");
		System.out.println(data);// 콘솔 확인용


		response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println(data);
		out.close();
		
		/*
		request.setAttribute("theaterId", request.getParameter("theaterId"));
		request.setAttribute("movieId", request.getParameter("movieId"));
		request.setAttribute("year", c.get(Calendar.YEAR));
		request.setAttribute("dayList", dayList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectDate.jsp");
		rd.forward(request, response);
		*/
	}
	
	

}
