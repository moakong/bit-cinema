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
@WebServlet("/review/update")
public class Update extends HttpServlet{

	SqlSession sqlsession ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	public Update(){
		sqlsession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlsession.getMapper(ReviewMapper.class); 
		mapperMovie = sqlsession.getMapper(MovieMapper.class); 
	}

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int REVIEW_NO = Integer.parseInt(request.getParameter("no"));
		String mid = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		request.setAttribute("mid", mid);
		
		
		ReviewVO vo = new ReviewVO();
		vo.setContent(content);
		vo.setTitle(title);
		vo.setReviewNo(REVIEW_NO);
		
		System.out.println(title);
		System.out.println(content);
		
		try {
			mapper.updateReview(vo);
			sqlsession.commit();
			
		} catch (Exception e) {
			new ServletException(e);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/review/Review?id="+mid);
		rd.forward(request, response);
	}

}
