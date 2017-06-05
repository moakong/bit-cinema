package kr.co.bit_cinema.repository.servlet.snack;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.SnackMapper;
import kr.co.bit_cinema.repository.vo.SnackVO;

@WebServlet("/snack/ListSnack")
public class ListSnackServlet extends HttpServlet {

	private SqlSession session = null;
	private SnackMapper mapper = null;

	public ListSnackServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(SnackMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = 5;
		String temp = request.getParameter("category");
		if (temp != null) {
			no = Integer.parseInt(temp);
		}
		List<SnackVO> list = null;
		try {
			if(no == 5){
				list = mapper.bestSnack();
			}
			else{
				list = mapper.listSnack(no);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/snack/listSnack.jsp");
		rd.forward(request, response);
	}

}
