package kr.co.bit_cinema.repository.servlet.rating;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.RatingMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.RatingVO;
import kr.co.bit_cinema.repository.vo.RatingVO;;

@WebServlet("/rating/updateRating")
public class UpdateRatingServlet extends HttpServlet {
	
	private SqlSession session = null;
	private MovieMapper movieMapper = null;
	private RatingMapper ratingMapper = null;
	
	public UpdateRatingServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		movieMapper = session.getMapper(MovieMapper.class);
		ratingMapper = session.getMapper(RatingMapper.class);
		
	}
	
	public void service(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int mId = Integer.parseInt(request.getParameter("id"));
		int ratingNo = Integer.parseInt(request.getParameter("ratingNo"));
		
		
		
		String noRating = request.getParameter("updateRating");
		
		if (noRating == null) {
			
			noRating = "0";
			System.out.println("noRating = " + noRating);
		}
		

		
		String updateSpoiler = request.getParameter("updateSpoiler");
		
		int chkSpo = 0;
		
		if (updateSpoiler != null)
			chkSpo = 1;
		
		int updateRating = Integer.parseInt(request.getParameter("updateRating"));
		
		System.out.println("updateRating" + updateRating);
		String updateContent = request.getParameter("updateContent");
		
		RatingVO rating = new RatingVO();
		
		try {
			//mId = movie id
			
			String memberId = request.getParameter("memberId");
			
			
			
			HttpSession hSession = request.getSession();
			MemberVO member = (MemberVO) hSession.getAttribute("user");
			
			
			rating.setRatingNo(ratingNo);
			rating.setRating(Integer.parseInt(noRating));
			
			rating.setContent(updateContent);
			rating.setSpoiler(chkSpo);
			
				
			ratingMapper.updateRating(rating);
			session.commit();
				
			request.setAttribute("rating", rating);
				
		
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	
		response.sendRedirect(request.getContextPath() + "/rating/Rating?id=" + mId);
	}

}
