package kr.co.bit_cinema.repository.servlet.review;

import java.io.IOException;
import java.util.List;

import javax.jws.WebService;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.ReviewMapper;
import kr.co.bit_cinema.repository.vo.ReviewFileVO;
import kr.co.bit_cinema.repository.vo.ReviewVO;

@WebServlet("/review/Detail")
public class ReviewDetail extends HttpServlet{
	SqlSession session ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	
	public ReviewDetail(){
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(ReviewMapper.class); 
		mapperMovie = session.getMapper(MovieMapper.class); 
	}

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String mmid = request.getParameter("mmid");
		
		
		
		ReviewVO review = new ReviewVO();
		
		List<ReviewFileVO> files = null;
//		ReviewFileVO file = new ReviewFileVO();
		try {
			
			
			//글내용
			review = mapper.detailReview(reviewNo);
			request.setAttribute("review", review);
			
			//추천수 증가 
			System.out.println(review.getRecomCount());

			int count = review.getRecomCount() + 1;
			review.setRecomCount(count);
			 mapper.updateRecom(review);
			 session.commit();
			
			//파일
			files = mapper.listFile(reviewNo);
			System.out.println("files"+files);
			
			
			request.setAttribute("files", files);
			request.setAttribute("mmid", mmid);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			new ServletException(e);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/review/detail.jsp");
		
		rd.forward(request, response);
	
		
	}

	
	
}
