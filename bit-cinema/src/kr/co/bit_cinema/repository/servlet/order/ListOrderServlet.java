package kr.co.bit_cinema.repository.servlet.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.CartMapper;

@WebServlet("/order/ListOrder")
public class ListOrderServlet extends HttpServlet {
	private SqlSession session = null;
	private CartMapper mapper = null;

	public ListOrderServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(CartMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/listOrder.jsp");
		rd.forward(request, response);
	}

}
