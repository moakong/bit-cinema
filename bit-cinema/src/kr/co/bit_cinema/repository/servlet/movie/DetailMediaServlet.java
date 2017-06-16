package kr.co.bit_cinema.repository.servlet.movie;

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
import kr.co.bit_cinema.repository.vo.movie.BoxVO;
import kr.co.bit_cinema.repository.vo.movie.MovieVO;
import kr.co.bit_cinema.repository.vo.movie.PhotoVO;
import kr.co.bit_cinema.repository.vo.movie.VideoVO;

@WebServlet("/movie/DetailMedia")
public class DetailMediaServlet extends HttpServlet {
	private SqlSession session = null;
	private MovieMapper mapper = null;
	
	public DetailMediaServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MovieMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		MovieVO movie = null;
		List<String> genre = null;
		String photo = null;
		List<VideoVO> videos = null;
		List<String> photos = null;
		BoxVO box = null;
		try {
			movie = mapper.infoMovie(id);
			genre = mapper.infoGenre(id);
			photo = mapper.selectThumbnail(id);
			videos = mapper.selectVideo(id);
			photos = mapper.selectPhoto(id);
			box = mapper.selectBox(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("movie", movie);
		request.setAttribute("genre", genre);
		request.setAttribute("photo", photo);
		request.setAttribute("videos", videos);
		request.setAttribute("photos", photos);
		request.setAttribute("box", box);

		
		RequestDispatcher rd = request.getRequestDispatcher("/view/movie/detailMedia.jsp");
		rd.forward(request, response);
	}
}
