package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberVO param = new MemberVO();
		param.setMemberId(id);
		param.setPass(pass);
		
		try {
			MemberVO user = mapper.loginMember(param);
			
			// id가 a 이고 pass가 1 일 경우 로그인 성공으로 처리
			if (user != null) {
				HttpSession session = request.getSession();
				// 세션에 사용자 정보를 저장
				session.setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + "/main/Main");
			}
			// 로그인 실패
			else {
				request.setAttribute("error", "입력하신 정보가 올바르지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("LoginForm");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}




















