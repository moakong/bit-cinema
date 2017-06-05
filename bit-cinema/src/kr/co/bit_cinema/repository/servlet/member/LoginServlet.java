package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MemberMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;

@WebServlet("/member/Login")
public class LoginServlet extends HttpServlet {

	private SqlSession sqlSession = null;
	private MemberMapper mapper = null;
	
	public LoginServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie = null;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String id_rem = request.getParameter("id_rem");
		System.out.println(id_rem);
		
		if(id_rem != null && id_rem.equals("on")){
			cookie = new Cookie("id", id);
			cookie.setMaxAge(60*60*24*365);
		}else{
			cookie = new Cookie("id", null);
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		
		MemberVO param = new MemberVO();
		param.setMemberId(id);
		param.setPass(pass);
		
		try {
			MemberVO user = mapper.loginMember(param);
			
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + "/main/Main");
			}else {
				request.setAttribute("error", "입력하신 정보가 올바르지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("LoginForm");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}




















