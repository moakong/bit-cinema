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

@WebServlet("/member/FindId")
public class FindIdServlet extends HttpServlet {

	private SqlSession sqlSession = null;
	private MemberMapper mapper = null;
	
	public FindIdServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberVO param = new MemberVO();
		param.setName(name);
		param.setEmail(email);
		
		String id = null;
		try {
			id = mapper.findMemberId(param);
			
			if (id != null) {
				request.setAttribute("id", id);
				RequestDispatcher rd = request.getRequestDispatcher("/view/member/findId.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("error", "입력하신 정보를 찾을 수 없습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("FindIdForm");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
