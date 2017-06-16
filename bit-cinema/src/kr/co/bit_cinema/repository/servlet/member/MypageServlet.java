package kr.co.bit_cinema.repository.servlet.member;

import java.io.IOException;
import java.util.ArrayList;
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
import kr.co.bit_cinema.repository.mapper.ReservationMapper;
import kr.co.bit_cinema.repository.mapper.ReviewMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.RatingVO;
import kr.co.bit_cinema.repository.vo.ReviewVO;
import kr.co.bit_cinema.repository.vo.movie.MovieVO;
import kr.co.bit_cinema.repository.vo.reservation.ReservationVO;

@WebServlet("/member/Mypage")
public class MypageServlet extends HttpServlet {
	SqlSession session;
	ReservationMapper reservationMapper;
	RatingMapper ratingMapper;
	ReviewMapper reviewMapper;
	MovieMapper movieMapper;
	
	public MypageServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reservationMapper = session.getMapper(ReservationMapper.class);
		ratingMapper = session.getMapper(RatingMapper.class);
		reviewMapper = session.getMapper(ReviewMapper.class);
		movieMapper = session.getMapper(MovieMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hSession = request.getSession();
		MemberVO member = (MemberVO)hSession.getAttribute("user");
		System.out.println("검색 아이디 : " + member.getMemberId());
		
		List<ReservationVO> reservations = null;
		List<RatingVO> ratings = null;
		List<ReviewVO> reviews = null;
		
		
		List<MovieVO> rivewMovie = new ArrayList<>();
		List<MovieVO> ratingMovie = new ArrayList<>();
		
		try {
			reservations = reservationMapper.checkReservationsById(member.getMemberId());
			ratings = ratingMapper.myRating(member.getMemberId());
			reviews = reviewMapper.myReview(member.getMemberId());
			
			for(RatingVO r : ratings){
				int id = r.getMovieId();
				MovieVO m = movieMapper.infoMovie(id);
				ratingMovie.add(m);
			}
			
			for(ReviewVO r : reviews){
				int id = r.getMovieId();
				MovieVO m = movieMapper.infoMovie(id);
				rivewMovie.add(m);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("reservations", reservations);
		request.setAttribute("ratings", ratings);
		request.setAttribute("reviews", reviews);
		request.setAttribute("ratingMovie", ratingMovie);
		request.setAttribute("rivewMovie", rivewMovie);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/member/mypage.jsp");
		rd.forward(request, response);
	}
	
}
