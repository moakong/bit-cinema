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
import kr.co.bit_cinema.repository.vo.movie.BoxVO;
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
		List<String> genre = null;
		String photo = null;
		List<String> photos = null;
		BoxVO box = null;
		try {
			movie = mapperMovie.infoMovie(id);
			genre = mapperMovie.infoGenre(id);
			photo = mapperMovie.selectThumbnail(id);
			list = mapper.listReview(id);
			photos = mapperMovie.selectPhoto(id);
			box = mapperMovie.selectBox(id);
		} catch (Exception e) {
			new ServletException(e);
		}
		request.setAttribute("movie", movie);
		request.setAttribute("genre", genre);
		request.setAttribute("photo", photo);
		request.setAttribute("photos", photos);
		request.setAttribute("list", list);
		request.setAttribute("box", box);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/review/review.jsp");
		
		rd.forward(request, response);
	
	
	
	}

	
	
}
