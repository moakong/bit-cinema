package kr.co.bit_cinema.repository.servlet.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.CartMapper;
import kr.co.bit_cinema.repository.vo.CartVO;
import kr.co.bit_cinema.repository.vo.MemberVO;

@WebServlet("/cart/ListCart")
public class ListCartServlet extends HttpServlet {
	private SqlSession sqlSession = null;
	private CartMapper mapper = null;

	public ListCartServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(CartMapper.class);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sId = request.getParameter("snackId");
		
		CartVO curCart = null;
		// 장바구니에 넣기 버튼으로 넘어 온 거
		if (sId != null) {
			int snackId = Integer.parseInt(sId);
			int count = Integer.parseInt(request.getParameter("count"));
			
			try {
				curCart = mapper.selectOneCart(snackId);
				// 장바구니에 상품이 있으니 update
				if (curCart != null){
					curCart.setCount(curCart.getCount() + count);
					mapper.updateCart(curCart);
					sqlSession.commit();
				}
				// 장바구니에 상품이 없으니 insert
				else {
					CartVO cart = new CartVO();
					
					HttpSession session = request.getSession();
					MemberVO member = (MemberVO)session.getAttribute("user");
					cart.setMemberId(member.getMemberId());
					cart.setSnackId(snackId);
					cart.setCount(count);

					mapper.insertCart(cart);
					sqlSession.commit();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
