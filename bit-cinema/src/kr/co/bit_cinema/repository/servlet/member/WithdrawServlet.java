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

@WebServlet("/member/Withdraw")
public class WithdrawServlet extends HttpServlet{
	private SqlSession sqlSession = null;
	private MemberMapper mapper = null;
	
	public WithdrawServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(!user.getPass().equals(request.getParameter("pass"))){
				System.out.println("user pass : " + user.getPass());
				System.out.println("request pass : " + request.getParameter("pass"));
				System.out.println("비밀번호가 틀린데... alert을 어떻게하냐..");
			}
			
			try {
				mapper.withdrawMember(user.getMemberId());
				sqlSession.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("/view/member/withdraw.jsp");
			rd.forward(request, response);
	}

}
