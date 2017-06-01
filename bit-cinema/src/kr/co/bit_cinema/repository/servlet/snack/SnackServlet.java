package kr.co.bit_cinema.repository.servlet.snack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.SnackMapper;
import kr.co.bit_cinema.repository.servlet.member.MypageServlet;


@WebServlet("/snack/Snack")
public class SnackServlet extends HttpServlet{

	private SqlSession session = null;
	private SnackMapper mapper = null;
	
	public SnackServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(SnackMapper.class);
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("category"));
		try {
			mapper.selectSnacks(no);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/snack/snackList.jsp");
		rd.forward(request, response);
	}
	
}
