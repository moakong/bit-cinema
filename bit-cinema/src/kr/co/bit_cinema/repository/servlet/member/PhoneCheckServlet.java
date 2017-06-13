package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/PhoneCheck")
public class PhoneCheckServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String phone = request.getParameter("phone");
		
		PrintWriter out = response.getWriter();
		
		if(phone.matches("^[0-9]+$")){
			
		}
		else{
			out.println("x");
		}
		
		out.close();
	}
	
}
