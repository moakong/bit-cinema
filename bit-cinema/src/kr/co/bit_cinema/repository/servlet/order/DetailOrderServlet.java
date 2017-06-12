package kr.co.bit_cinema.repository.servlet.order;

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
import kr.co.bit_cinema.repository.mapper.OrderMapper;
import kr.co.bit_cinema.repository.vo.OrderDetailVO;
import kr.co.bit_cinema.repository.vo.OrderVO;

@WebServlet("/order/detailOrder")
public class DetailOrderServlet extends HttpServlet{
	private SqlSession session = null;
	private OrderMapper mapper = null;

	public DetailOrderServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(OrderMapper.class);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String orderId = request.getParameter("orderId");
		List<OrderVO> list = null;
		List<OrderDetailVO> dList = null;
		try {
			//list = mapper.listOrder(member.getMemberId());
			dList = mapper.detailOrder(orderId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/detailOrder.jsp");
		rd.forward(request, response);
	}
	
}
