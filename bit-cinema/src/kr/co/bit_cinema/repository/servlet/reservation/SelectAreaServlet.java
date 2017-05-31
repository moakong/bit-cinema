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
		
		List<TheaterVO> list = null;
		
		try {
			list = mapper.selectArea(1); // 동적으로 변경필요!
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("!!!지역test!!!");
		System.out.println(list);
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectArea.jsp");
		rd.forward(request, response);
	}

	
}





