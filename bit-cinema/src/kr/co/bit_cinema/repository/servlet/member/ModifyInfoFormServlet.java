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

@WebServlet("/member/ModifyInfoForm")
public class ModifyInfoFormServlet extends HttpServlet {

	private SqlSession sqlSession = null;
	private MemberMapper mapper = null;
	
	public ModifyInfoFormServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO member = null;
		try {
			
			member = mapper.infoMember(user.getMemberId());
			sqlSession.commit();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("member", member);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/member/modifyInfoForm.jsp");
		rd.forward(request, response);
	}
}
