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

@WebServlet("/cart/DeleteCart")
public class DeleteCartServlet extends HttpServlet{
	private SqlSession sqlSession = null;
	private CartMapper mapper = null;

	public DeleteCartServlet() {
		sqlSession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlSession.getMapper(CartMapper.class);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		CartVO param = new CartVO();
		param.setMemberId(member.getMemberId());
		
		try {
			String[] str = request.getParameterValues("checkCart");
			for(String s : str){
				int no = Integer.parseInt(s);
				param.setSnackId(no);
				mapper.deleteCart(param);
			}
			sqlSession.commit();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<CartVO> list = null;
		try {
			list = mapper.selectCart(member.getMemberId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/cart/cartList.jsp");
		rd.forward(request, response);
	}
}
