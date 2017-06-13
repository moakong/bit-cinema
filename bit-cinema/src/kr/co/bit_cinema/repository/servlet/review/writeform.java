package kr.co.bit_cinema.repository.servlet.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/writeform")
public class writeform extends HttpServlet{
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid");
		
		request.setAttribute("mid", mid);
		
		RequestDispatcher rd = request.getRequestDispatcher("view/review/writef.jsp");
	
		rd.forward(request, response);
	}

}
