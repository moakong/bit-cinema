package kr.co.bit_cinema.repository.servlet.review;

import java.io.IOException;

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
@WebServlet("/review/updateform")
public class ReviewUpdateform extends HttpServlet{
	SqlSession sqlsession ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	public ReviewUpdateform(){
		sqlsession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlsession.getMapper(ReviewMapper.class); 
		mapperMovie = sqlsession.getMapper(MovieMapper.class); 
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("id");
		
		request.setAttribute("reviewNo", reviewNo);
		request.setAttribute("id", id);
		
		ReviewVO review = new ReviewVO();
		
		try {
			review = mapper.detailReview(reviewNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			new ServletException(e);
		}
		
		request.setAttribute("review", review);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/review/updateform.jsp");
		rd.forward(request, response);
	}

}
