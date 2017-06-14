package kr.co.bit_cinema.repository.servlet.rating;

import java.io.IOException;
import java.util.Enumeration;
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
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.RatingMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;

import kr.co.bit_cinema.repository.vo.RatingVO;


@WebServlet("/rating/writeRating")
public class WriteRatingServlet extends HttpServlet {
	
	private SqlSession session = null;
	private MovieMapper movieMapper = null;
	private RatingMapper ratingMapper = null;
	
	public WriteRatingServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		movieMapper = session.getMapper(MovieMapper.class);
		ratingMapper = session.getMapper(RatingMapper.class);
		
	}
	
	public void service(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		//request.setCharacterEncoding("utf-8");
		
		
		HttpSession hSession = request.getSession();
		MemberVO member = (MemberVO) hSession.getAttribute("user");
		
	
	
		//id, mid: movie id
		int mId = Integer.parseInt(request.getParameter("id"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		String spoiler = request.getParameter("spoiler");

		//MovieVO movie = new MovieVO();
		
		
		
		
		if(spoiler == null) {
			//System.out.println("spoiler = " + spoiler);
			spoiler = "0";
			System.out.println("spoiler = " + spoiler);
			
		}
		
		
	
		RatingVO ratingVO = new RatingVO();
		
		
		ratingVO.setMemberId(member.getMemberId());
		ratingVO.setNickname(member.getNickname());
		
		ratingVO.setMovieId(mId);
		
		ratingVO.setRating(rating);
		ratingVO.setContent(request.getParameter("content"));
		ratingVO.setSpoiler(Integer.parseInt(spoiler));
	
		
		try {
			
			System.out.println(ratingVO);
			
			ratingMapper.insertRating(ratingVO);
			session.commit();
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			new ServletException(e);
		}
		response.sendRedirect(request.getContextPath() + "/rating/Rating?id=" + mId);
	}
}
