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

		
		// 자리는 값이 여러개라 스트링 배열로 받음
		// String[] seats = request.getParameterValues("seat");
		
		
		
		request.setAttribute("people", request.getParameter("people"));
		request.setAttribute("seats", request.getParameterValues("seat")); // 배열도 바로 넣을 수 있나? ㅇㅇ
		request.setAttribute("schNo", request.getParameter("schNo"));
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/payment.jsp");
		rd.forward(request, response);
		
		
		
	}

	
}









