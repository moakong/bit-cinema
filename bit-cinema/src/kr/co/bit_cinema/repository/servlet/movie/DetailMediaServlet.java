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
import kr.co.bit_cinema.repository.vo.MediaVO;
import kr.co.bit_cinema.repository.vo.MovieVO;

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
		List<MediaVO> medias = null;
		try {
			movie = mapper.infoMovie(id);
			medias = mapper.selectMedia(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("movie", movie);
		request.setAttribute("medias", medias);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/movie/detailMedia.jsp");
		rd.forward(request, response);
	}
}
