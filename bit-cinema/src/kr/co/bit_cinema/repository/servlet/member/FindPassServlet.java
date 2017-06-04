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

@WebServlet("/member/FindPass")
public class FindPassServlet extends HttpServlet {

	private SqlSession sqlSession = null;
	private MemberMapper mapper = null;
	
	public FindPassServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
	
		MemberVO param = new MemberVO();
		param.setName(name);
		param.setMemberId(id);
		param.setEmail(email);
		
		String pass = null;
		try {
			pass = mapper.findMemberPass(param);
			
			if (pass != null) {
				pass = convert(pass);
				request.setAttribute("pass", pass);
				RequestDispatcher rd = request.getRequestDispatcher("/view/member/findPass.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("error", "입력하신 정보를 찾을 수 없습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("FindPassForm");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	String convert(String pass){
		String newPass = "";
		newPass = pass.substring(0, 4);
		for(int i = 0; i < pass.length()-4; i++)
			newPass += "*";
		return newPass;
	}

}
