package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/PwdCheck")
public class PwdCheckServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String pass = request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		if(pass.length() < 8){
			out.println("8~12글자를 입력해주세요.");
		}else if(pass.matches("^[a-zA-Z]+$") || pass.matches("^[0-9]+$")){
			out.println("비밀번호 형식에 맞춰서 입력해주세요.");
		}else {
			out.println("비밀번호가 확인되었습니다.");
		}
		
		out.close();
	}
}
