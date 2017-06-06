package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/LoginForm")
public class LoginFormServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = "";
		Cookie[] cookie = request.getCookies();
		if(cookie != null){
			for(int i = 0; i < cookie.length; i++){
				if(cookie[i].getName().equals("id")){
					id = cookie[i].getValue();
				}
			}
		}
		
//		System.out.println(request.getAttribute("error"));
//		request.setAttribute("error", request.getAttribute("error"));
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/member/loginForm.jsp");
		rd.forward(request, response);
	}
	
}














