package kr.co.bit_cinema.repository.servlet.rating;

import java.io.IOException;
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
import kr.co.bit_cinema.repository.mapper.MemberMapper;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.RatingMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;

import kr.co.bit_cinema.repository.vo.RatingVO;
import kr.co.bit_cinema.repository.vo.ReviewVO;
import kr.co.bit_cinema.repository.vo.movie.MovieVO;

@WebServlet("/rating/Rating")
public class RatingServlet extends HttpServlet {

	private SqlSession session = null;
	private MovieMapper movieMapper = null;
	private RatingMapper ratingMapper = null;
	//private MemberMapper memberMapper = null;
	
	public RatingServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		movieMapper = session.getMapper(MovieMapper.class);
		ratingMapper = session.getMapper(RatingMapper.class);
		//memberMapper = session.getMapper(MemberMapper.class);

	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mId = Integer.parseInt(request.getParameter("id"));
		// String ratingNo = request.getParameter("ratingNo");

		try {
			// List<RatingVO> listRating = ratingMapper.selectNewRating();
			MovieVO movie = movieMapper.infoMovie(mId);
			request.setAttribute("movie", movie);

			
			String ratingNo = request.getParameter("ratingNo");
			if (ratingNo != null) {
				request.setAttribute("ratingNo", ratingNo);			
			}
			
			
			
			
			List<RatingVO> listRating = ratingMapper.selectNewRating(mId);

			// System.out.println("ratingNo = " + ratingNo);
			// request.setAttribute("ratingNo", ratingNo);

			request.setAttribute("listRating", listRating);

			
			RequestDispatcher rd = request.getRequestDispatcher("/view/rating/rating.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			throw new ServletException(e);
		}

	}
}
