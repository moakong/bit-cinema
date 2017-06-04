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

@WebServlet("/reservation/finish")
public class finishServlet extends HttpServlet {

	SqlSession session;
	ReservationMapper mapper;
	
	public finishServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hSession = request.getSession();
		MemberVO member = (MemberVO)hSession.getAttribute("user");
		System.out.println("예약자 아이디 : " + member.getMemberId());
		
		String memberId = member.getMemberId();
		int scheduleId = Integer.parseInt(request.getParameter("schNo"));
		String[] seats = request.getParameterValues("seat");
		int rCount = seats.length;
		
		
		
		
		ReservationVO reservationParam = new ReservationVO();
		reservationParam.setMemberId(memberId);
		reservationParam.setScheduleId(scheduleId);
		reservationParam.setrCount(rCount);
		
		ReservationVO rInfo = new ReservationVO();
		List<ReservationVO> sList = null;
		try {
			mapper.insertReservation(reservationParam);
			int reservationId = reservationParam.getReservationId();
			System.out.println("새 예약번호 : " + reservationId); //temp
			
			for(String e : seats){
				reservationParam.setSeatId(Integer.parseInt(e));
				mapper.insertReservedSeat(reservationParam);
			}
			
			//session.commit();///////////////////////////////////////
			
			
			//방금 예약한 정보 꺼내기
			rInfo.setMovieName(mapper.selectMovieName(reservationId).getMovieName());
			
			reservationParam = mapper.selectSchduleInfo(reservationId);
			rInfo.setScreenName(reservationParam.getScreenName());
			rInfo.setStartDate(reservationParam.getStartDate());
			rInfo.setStartTime(reservationParam.getStartTime());
			rInfo.setEndTime(reservationParam.getEndTime());
			
			sList = mapper.selectSeatInfo(reservationId);
			rInfo.setrCount(sList.get(0).getrCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		request.setAttribute("rInfo", rInfo);
		request.setAttribute("sList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/finish.jsp");
		rd.forward(request, response);
	}
	
}











