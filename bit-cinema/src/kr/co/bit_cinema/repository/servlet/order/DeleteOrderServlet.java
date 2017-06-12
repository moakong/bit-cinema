package kr.co.bit_cinema.repository.servlet.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.OrderMapper;
@WebServlet("/order/DeleteOrder")
public class DeleteOrderServlet extends HttpServlet{
	private SqlSession session;
	private OrderMapper mapper;
	public DeleteOrderServlet(){
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(OrderMapper.class);
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
