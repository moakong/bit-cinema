package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;
import java.io.PrintWriter;

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
		response.setContentType("text/html; charset=utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("passId");
		String email = request.getParameter("email");
	System.out.println(name);
	System.out.println(id);
	System.out.println(email);
		MemberVO param = new MemberVO();
		param.setName(name);
		param.setMemberId(id);
		param.setEmail(email);
		
		String pass = null;
		PrintWriter out = response.getWriter();
		try {
			pass = mapper.findMemberPass(param);
			System.out.println(pass);
			if (pass != null) {
				pass = convert(pass);
				out.println(pass);
			}else {
				out.println("입력하신 정보를 찾을 수 없습니다.");
			}
			
			out.close();
			
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
