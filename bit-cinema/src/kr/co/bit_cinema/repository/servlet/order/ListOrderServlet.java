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
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.OrderDetailVO;
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
		List<OrderDetailVO> dList = null;
		List<String> title = new ArrayList<>();
		List<String> img = new ArrayList<>();
		try {
				list = mapper.listOrder(member.getMemberId());
				
				for(int i = 0; i < list.size(); i++){
					String oId = list.get(i).getOrderId();
					dList = mapper.detailOrder(oId);
					String tmp = dList.get(0).getName();
					tmp += " " + dList.get(0).getCount() + "개";
					if(dList.size() != 1){
						tmp += " 외 " + (dList.size()-1) + "건";
					}
					title.add(tmp);
					img.add(dList.get(0).getImg());
				}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("orderList", list);
		request.setAttribute("title", title);
		request.setAttribute("img", img);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/order/listOrder.jsp");
		rd.forward(request, response);
	}
}