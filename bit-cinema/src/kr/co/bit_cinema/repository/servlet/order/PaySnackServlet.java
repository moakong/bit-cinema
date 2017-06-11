package kr.co.bit_cinema.repository.servlet.order;

import java.io.IOException;
import java.util.ArrayList;
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
import kr.co.bit_cinema.repository.mapper.OrderMapper;
import kr.co.bit_cinema.repository.vo.CartToOrderVO;
import kr.co.bit_cinema.repository.vo.CartVO;
import kr.co.bit_cinema.repository.vo.MemberVO;

@WebServlet("/order/PaySnack")
public class PaySnackServlet extends HttpServlet {

	private SqlSession sqlSession = null;
	private OrderMapper mapper = null;

	public PaySnackServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(OrderMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		List<CartToOrderVO> list = new ArrayList<>();
		int totalCount = 0;
		try {
			CartVO cart = new CartVO();
			cart.setMemberId(member.getMemberId());
			String[] carts = request.getParameterValues("checkCart");
			for (String s : carts) {
				int sId = Integer.parseInt(s);
				cart.setSnackId(sId);
				list.add(mapper.selectCart(cart));
			}
			for(int i = 0; i < list.size(); i++){
				int amount = list.get(i).getPrice() * list.get(i).getCount();
				list.get(i).setAmount(amount);
				totalCount += amount;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("cartList", list);
		request.setAttribute("totalCount", totalCount);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/payment.jsp");
		rd.forward(request, response);

	}

}
