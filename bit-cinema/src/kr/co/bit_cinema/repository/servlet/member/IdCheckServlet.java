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

@WebServlet("/member/IdCheck")
public class IdCheckServlet extends HttpServlet {

	private SqlSession session = null;
	private MemberMapper mapper = null;
	
	public IdCheckServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MemberMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String id = request.getParameter("id");

		try{
			String name = mapper.checkId(id);
			
			PrintWriter out = response.getWriter();
			if(name != null){
				out.println("이미 사용중인 아이디입니다.");
			}else{
				out.println("사용 가능한 아이디입니다.");
			}
			
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
