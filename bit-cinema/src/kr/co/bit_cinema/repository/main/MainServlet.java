package kr.co.bit_cinema.repository.main;

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
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.vo.MovieVO;

@WebServlet("/main/Main")
public class MainServlet extends HttpServlet {
	
	private SqlSession session = null;
	private MovieMapper mapper = null;
	
	public MainServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MovieMapper.class);
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<MovieVO> boxMovie = null;
		try {
			boxMovie= mapper.boxMovie();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("boxMovie", boxMovie);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/main/main.jsp");
		rd.forward(request, response);
	}
}












