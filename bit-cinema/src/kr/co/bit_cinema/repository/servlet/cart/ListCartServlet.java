package kr.co.bit_cinema.repository.servlet.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.CartMapper;
import kr.co.bit_cinema.repository.vo.CartVO;

@WebServlet("/cart/ListCart")
public class ListCartServlet extends HttpServlet {
	private SqlSession session = null;
	private CartMapper mapper = null;

	public ListCartServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(CartMapper.class);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String st = request.getParameter("snackId");
		if (st != null){
		CartVO cart = new CartVO();
		int snackId = Integer.parseInt(st);
		int count = Integer.parseInt(request.getParameter("count"));
		cart.setMemberId("fam1");			
		cart.setSnackId(snackId);
		cart.setCount(count);
		
		try {
			mapper.insertCart(cart);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}}
		
		List<CartVO> list = null;
		try {
			list = mapper.selectCart();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/cart/cartList.jsp");
		rd.forward(request, response);
	}

}
