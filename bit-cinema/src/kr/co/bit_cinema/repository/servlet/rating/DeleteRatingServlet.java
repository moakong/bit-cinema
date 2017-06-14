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

@WebServlet("/rating/deleteRating")
public class DeleteRatingServlet extends HttpServlet {
	private SqlSession session = null;
	private MovieMapper movieMapper = null;
	private RatingMapper ratingMapper = null;
	
	public DeleteRatingServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		movieMapper = session.getMapper(MovieMapper.class);
		ratingMapper = session.getMapper(RatingMapper.class);
		
	}
	

	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int mId = Integer.parseInt(request.getParameter("id"));
		int ratingNo = Integer.parseInt(request.getParameter("ratingNo"));
		String memberId = request.getParameter("memberId");
		
		
		try {
			
			
			
			HttpSession hSession = request.getSession();
			MemberVO member = (MemberVO) hSession.getAttribute("user");
			
			if(memberId != member.getMemberId()) {
			
				ratingMapper.deleteRating(ratingNo);
				session.commit();
			
			}
			
			//RequestDispatcher rd = request.getRequestDispatcher("/view/rating/rating2.jsp");
			//rd.forward(request, response);

			
			response.sendRedirect(request.getContextPath() + "/rating/Rating?id=" + mId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	
		//response.sendRedirect(request.getContextPath() + "/rating/Rating?id=" + mId);

		
	}
}
