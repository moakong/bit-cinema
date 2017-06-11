package kr.co.bit_cinema.repository.servlet.order;

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
import kr.co.bit_cinema.repository.mapper.SnackMapper;
import kr.co.bit_cinema.repository.vo.SnackVO;

@WebServlet("/order/ListOrder")
public class ListOrderServlet extends HttpServlet {
	private SqlSession session = null;
	private CartMapper mapper = null;
	private SnackMapper smapper = null;
	

	public ListOrderServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(CartMapper.class);
		smapper = session.getMapper(SnackMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			SnackVO snack = null;
			int sn = Integer.parseInt(request.getParameter("snackId"));
			int count = Integer.parseInt(request.getParameter("count"));
			snack = smapper.detailSnack(sn);
			request.setAttribute("price", snack.getPrice()*count);
			request.setAttribute("count", count);
			request.setAttribute("snack", snack);
			RequestDispatcher rd = request.getRequestDispatcher("/view/order/listOrder.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*try {
			String[] str = request.getParameterValues("checkCart");
			CartVO cart = null;
			for(String s : str){
				int no = Integer.parseInt(s);				
				System.out.println(no);
				cart = mapper.selectOrder(no);
				request.setAttribute("cart", cart);				
			}
			RequestDispatcher rd = request.getRequestDispatcher("/view/order/listOrder.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	*/	
	}
}