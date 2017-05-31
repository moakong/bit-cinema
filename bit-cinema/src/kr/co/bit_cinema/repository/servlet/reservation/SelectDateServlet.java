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
		// bit-cinema/reservation/selectDate
		//		?movie=%EA%B0%80%EB%94%94%EC%96%B8%EC%A6%88+%EC%98%A4%EB%B8%8C+%EA%B0%A4%EB%9F%AD%EC%8B%9C+VOL.2
		
		/*
		 *  	(스케쥴 선택은 여기서 완료됨)
		 * 1. 오늘 기준 일주일 후 날짜까지 뿌려준다
		 * 2. 그 기간동안 이전 화면에서 넘어온 영화 스케쥴이 있는 날과 없는 날로 구분한다
		 * 3. 스케쥴이 없는 날은 아예 비활성화 시키거나, 스케쥴이 비었다고 만 써준다
		 *  
		 */
		
		Calendar c = Calendar.getInstance();
		
		List<String> dayList = new ArrayList<>();
		dayList.add("" + (c.get(Calendar.MONTH) + 1) + "월 " + c.get(Calendar.DATE) + "일");
		
		for(int i = 0; i < 6; i++) { 
			c.add(Calendar.DATE, 1);
			
			dayList.add("" + (c.get(Calendar.MONTH) + 1) + "월 " + c.get(Calendar.DATE) + "일");
		}
		
		request.setAttribute("dayList", dayList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectDate.jsp");
		rd.forward(request, response);
		
	}
	
	

}
