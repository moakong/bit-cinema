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

@WebServlet("/order/PayOneSnack")
public class PayOneSnackServlet extends HttpServlet{
	private SqlSession sqlSession = null;
	private OrderMapper mapper = null;

	public PayOneSnackServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(OrderMapper.class);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		CartToOrderVO cto = null;
		int totalCount = 0;
		try {
			CartVO cart = new CartVO();
			cart.setMemberId(member.getMemberId());
			
			cto = mapper.selectCart(cart);
			int count = Integer.parseInt(request.getParameter("count"));
			int price = Integer.parseInt(request.getParameter("price"));
			int amount = (count * price);
			int sId = Integer.parseInt(request.getParameter("snackId"));
			System.out.println(sId);
			cto = new CartToOrderVO();
			cto.setSnackId(sId);
			cto.setName(request.getParameter("name"));
			cto.setImg(request.getParameter("img"));
			cto.setCount(count);
			cto.setPrice(price);
			cto.setAmount(amount);
			totalCount += amount;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("cto", cto);
		request.setAttribute("totalCount", totalCount);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/payment.jsp");
		rd.forward(request, response);

	}
		
	
}
