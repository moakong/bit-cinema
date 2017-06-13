package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/EmailCheck")
public class EmailCheckServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String email = request.getParameter("email");
	
		PrintWriter out = response.getWriter();
		if(email.contains("@")){
			String temp = email.substring(email.indexOf("@"));
			if(temp.contains("."))
				out.println("o");
			else
				out.println("이메일 형식이 맞지않습니다.");
		}
		else
			out.println("이메일 형식이 맞지않습니다.");
		
		out.close();
	}
}
