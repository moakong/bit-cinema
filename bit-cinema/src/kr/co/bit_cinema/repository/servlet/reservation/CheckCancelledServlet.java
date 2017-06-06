package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.ReservationMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.reservation.ReservationVO;

@WebServlet("/reservation/checkCancelledR")
public class CheckCancelledServlet extends HttpServlet {
	SqlSession session;
	ReservationMapper mapper;
	
	public CheckCancelledServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hSession = request.getSession();
		MemberVO member = (MemberVO)hSession.getAttribute("user");
		System.out.println("검색 아이디 : " + member.getMemberId());
		
		List<ReservationVO> list = null;
		
		try {
			list = mapper.checkCancelledReservations(member.getMemberId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		for(ReservationVO e : list){
			System.out.println("예매번호 : " + e.getReservationId())  ;
		}
		
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/checkCancelledR.jsp");
		rd.forward(request, response);
	}

	
	
	
}
