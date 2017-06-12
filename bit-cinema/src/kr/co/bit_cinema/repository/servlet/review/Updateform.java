package kr.co.bit_cinema.repository.servlet.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/review/updateform")
public class Updateform extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		String id = request.getParameter("id");
		
		request.setAttribute("no", no);
		request.setAttribute("id", id);
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/review/updateform.jsp");
		rd.forward(request, response);
	}

}
