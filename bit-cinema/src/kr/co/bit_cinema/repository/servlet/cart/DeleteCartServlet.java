package kr.co.bit_cinema.repository.servlet.cart;

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

@WebServlet("/cart/DeleteCart")
public class DeleteCartServlet extends HttpServlet{
	private SqlSession session = null;
	private CartMapper mapper = null;

	public DeleteCartServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(CartMapper.class);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int no = Integer.parseInt(request.getParameter("${cart.snackId}"));
			System.out.println(no);
			mapper.deleteCart(no);
			session.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/cart/cartList.jsp");
	}
}
