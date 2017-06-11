package kr.co.bit_cinema.repository.servlet.order;

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
import kr.co.bit_cinema.repository.mapper.OrderMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.OrderVO;

@WebServlet("/order/ListOrder")
public class ListOrderServlet extends HttpServlet {
	private SqlSession sqlSession = null;
	private OrderMapper mapper = null;

	public ListOrderServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(OrderMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		List<OrderVO> list = null;
		try {
				list = mapper.listOrder(member.getMemberId());
//			SnackVO snack = null;
//			int sn = Integer.parseInt(request.getParameter("snackId"));
//			int count = Integer.parseInt(request.getParameter("count"));
//			snack = smapper.detailSnack(sn);
//			request.setAttribute("price", snack.getPrice()*count);
//			request.setAttribute("count", count);
//			request.setAttribute("snack", snack);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("orderList", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/listOrder.jsp");
		rd.forward(request, response);
	}
}