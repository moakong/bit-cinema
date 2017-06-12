package kr.co.bit_cinema.repository.servlet.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import kr.co.bit_cinema.repository.mapper.OrderMapper;
import kr.co.bit_cinema.repository.vo.CartToOrderVO;
import kr.co.bit_cinema.repository.vo.CartVO;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.OrderDetailVO;
import kr.co.bit_cinema.repository.vo.OrderVO;

@WebServlet("/order/InsertOrder")
public class InsertOrderServlet extends HttpServlet{

	private SqlSession sqlSession = null;
	private OrderMapper mapper = null;
	private CartMapper cartMapper = null;

	public InsertOrderServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(OrderMapper.class);
		cartMapper = sqlSession.getMapper(CartMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String orderId = sdf.format(new Date());
		
		try {
			String[] sId = request.getParameterValues("snackId");
			int totalCount = Integer.parseInt(request.getParameter("totalCount"));
			OrderVO order = new OrderVO();
			order.setOrderId(orderId);
			order.setMemberId(member.getMemberId());
			order.setAmount(totalCount);
			
			mapper.insertOrder(order);
			
			OrderDetailVO detail = new OrderDetailVO();
			detail.setOrderId(orderId);
		
			CartVO cart = new CartVO();
			cart.setMemberId(member.getMemberId());
			for (String s : sId) {
				int id = Integer.parseInt(s);
				cart.setSnackId(id);
				detail.setSnackId(id);
				CartToOrderVO c = mapper.selectCart(cart);
				detail.setCount(c.getCount());
				int amount = c.getPrice() * c.getCount();
				detail.setAmount(amount);
				mapper.insertOrderDetail(detail);
				cartMapper.deleteCart(cart);
			}
			sqlSession.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ListOrder");
		rd.forward(request, response);

	}
}
