package kr.co.bit_cinema.repository.servlet.review;

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
import kr.co.bit_cinema.repository.mapper.ReviewMapper;
import kr.co.bit_cinema.repository.vo.ReviewVO;
import kr.co.bit_cinema.repository.vo.movie.MovieVO;
@WebServlet("/review/Review")
public class ReviewServlet extends HttpServlet{
	SqlSession session ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	public ReviewServlet(){
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReviewMapper.class); 
		mapperMovie = session.getMapper(MovieMapper.class); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		MovieVO movie = null;
		List<ReviewVO> list = null;
		
		try {
			movie = mapperMovie.infoMovie(id);
			list = mapper.listReview(id);
		} catch (Exception e) {
			new ServletException(e);
		}
		request.setAttribute("movie", movie);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/review/review.jsp");
		
		rd.forward(request, response);
	
	
	
	}

	
	
}
