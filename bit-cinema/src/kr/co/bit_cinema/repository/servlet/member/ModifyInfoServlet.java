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

@WebServlet("/member/ModifyInfo")
public class ModifyInfoServlet extends HttpServlet {

	private SqlSession sqlSession = null;
	private MemberMapper mapper = null;
	
	public ModifyInfoServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		MemberVO member = null;
		try{
			String pass = request.getParameter("pass");
			String nickname = request.getParameter("nickname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			//String profile = request.getParameter("profile");

			member = new MemberVO();
			member.setMemberId(user.getMemberId());
			member.setPass(pass);
			member.setNickname(nickname);
			member.setPhone(phone);
			member.setEmail(email);
			//member.setProfile(profile);
			
			mapper.modifyMember(member);
			sqlSession.commit();
			
			RequestDispatcher rd = request.getRequestDispatcher("/view/member/modifyInfo.jsp");
			rd.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
