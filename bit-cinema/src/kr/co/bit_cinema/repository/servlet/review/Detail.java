package kr.co.bit_cinema.repository.servlet.review;

import java.io.IOException;

import javax.jws.WebService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.ReviewMapper;
import kr.co.bit_cinema.repository.vo.ReviewVO;

@WebServlet("/review/Detail")
public class Detail extends HttpServlet{
	SqlSession session ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	
	public Detail(){
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReviewMapper.class); 
		mapperMovie = session.getMapper(MovieMapper.class); 
	}

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("reviewNo"));
		
		ReviewVO review = new ReviewVO();
		try {
			review = mapper.detailReview(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			new ServletException(e);
		}
		
		request.setAttribute("review", review);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/review/detail.jsp");
		
		rd.forward(request, response);
	
		
	}

	
	
}
