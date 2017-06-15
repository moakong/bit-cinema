package kr.co.bit_cinema.repository.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import javafx.beans.binding.SetExpression;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.ReviewMapper;

@WebServlet("/review/delete")
public class ReviewDelete extends HttpServlet{
	SqlSession session ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	
	public ReviewDelete(){
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReviewMapper.class); 
		mapperMovie = session.getMapper(MovieMapper.class); 
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("id");
	
		try {
			mapper.deleteReview(no);
			session.commit();
			response.sendRedirect("/bit-cinema/review/Review?id="+id);
			
		} catch (Exception e) {
			new ServletException(e);
		}
	
	}
	
}
