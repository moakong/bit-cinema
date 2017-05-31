package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MemberMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;

@WebServlet("/member/Join")
public class JoinServlet extends HttpServlet{

	private SqlSession session = null;
	private MemberMapper mapper = null;
	
	public JoinServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO member = null;
		try{
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String emailId = request.getParameter("emailId");
			String emailAddr = request.getParameter("emailAddr");
			String phone = request.getParameter("phone");
			String agreeEmail = request.getParameter("agreeEmail");
			String agreePhone = request.getParameter("agreePhone");
		
			member = new MemberVO();
			member.setMemberId(id);
			member.setPass(pass);
			member.setName(name);
			member.setNickname(nickname);
			member.setPhone(phone);
			member.setEmailId(emailId);
			member.setEmailAddr(Integer.parseInt(emailAddr));
			//member.setAgreeEmail(Integer.parseInt(agreeEmail));
			member.setAgreeEmail(1);
			//member.setAgreePhone(Integer.parseInt(agreePhone));
			member.setAgreePhone(1);
			
			mapper.joinMember(member);
			session.commit();
			
			RequestDispatcher rd = request.getRequestDispatcher("/view/member/join.jsp");
			rd.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
