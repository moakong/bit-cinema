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
		String id = request.getParameter("id");
		boolean idch;
		try{
			String name = mapper.checkId(id);
			
			if(name != null){
				request.setAttribute("msg", "이미 사용중인 아이디입니다.");
				id = "";
				idch = false;
			}else{
				request.setAttribute("msg", "사용가능한 아이디입니다.");
				idch = true;
			}
			
			request.setAttribute("id", id);
			request.setAttribute("idch", idch);
			
			RequestDispatcher rd = request.getRequestDispatcher("/view/member/idCheck.jsp");
			rd.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
