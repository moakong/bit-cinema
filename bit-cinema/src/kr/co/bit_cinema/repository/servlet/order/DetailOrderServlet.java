package kr.co.bit_cinema.repository.servlet.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.OrderDetailVO;
import kr.co.bit_cinema.repository.vo.OrderVO;

@WebServlet("/order/DetailOrder")
public class DetailOrderServlet extends HttpServlet{
	private SqlSession session = null;
	private OrderMapper mapper = null;

	public DetailOrderServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(OrderMapper.class);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		String orderId = request.getParameter("orderId");
		List<OrderDetailVO> dList = null;
		OrderVO order = null;
		SimpleDateFormat sd = new SimpleDateFormat("yyyy년MM월dd일까지");
		String date= null;
		try {
			dList = mapper.detailOrder(orderId);
			order = mapper.orderSelect(orderId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("dlist", dList);
		request.setAttribute("order", order);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/detailOrder.jsp");
		rd.forward(request, response);
	}
	
}
