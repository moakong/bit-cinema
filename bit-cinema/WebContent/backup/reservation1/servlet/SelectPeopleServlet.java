package kr.co.bit_cinema.repository.servlet.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reservation/selectPeople")
public class SelectPeopleServlet extends HttpServlet {
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int schNo =  Integer.parseInt(request.getParameter("time"));
		
		
		request.setAttribute("schNo", schNo);
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectPeople.jsp");
		rd.forward(request, response);
		
	}
	
	
	

}











