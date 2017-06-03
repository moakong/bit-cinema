package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation/payment")
public class paymentServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 원래는 이번 결제 프로세스가 끝난  예약 insert를 해야 하지만, 지금 예매는 형식적으로만 하기때문에
		// 이번에 예매 관련 정보를 insert끝내고
		// 다음 예매완료 서블릿에서 예매 정보 뿌려주는 것으로..
		
		int schNo =  Integer.parseInt(request.getParameter("schNo"));
		int people =  Integer.parseInt(request.getParameter("people")); //필요한가?
		
		// 자리는 값이 여러개라 스트링 배열로 받음
		String[] seats = request.getParameterValues("seat");
		
//		for(String e : seats){
//			System.out.println(e);
//		}
		
		
		
		// insert쿼리 넣어야함! ======================================
		// 일단 commit;은 빼자
		
		
		
		
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/payment.jsp");
		rd.forward(request, response);
		
		
		
	}

	
}









