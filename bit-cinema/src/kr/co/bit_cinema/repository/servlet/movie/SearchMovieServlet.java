package kr.co.bit_cinema.repository.servlet.movie;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/movie/SearchMovie")
public class SearchMovieServlet extends HttpServlet {

	private SqlSession session = null;
	private MovieMapper mapper = null;
	
	public SearchMovieServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MovieMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		List<MovieVO> list = null;
		List<String> photo = new ArrayList<>();
		List<BoxVO> box = new ArrayList<>();
		try {
			list = mapper.searchMovie(name);
			for(int i = 0; i < list.size(); i++){
				String route = mapper.selectThumbnail(list.get(i).getMovieId());
				BoxVO b = mapper.selectBox(list.get(i).getMovieId());
				photo.add(route);
				box.add(b);
			}
//			genre = mapper.infoGenre(id);
//			photo = mapper.selectThumbnail(id);
//			directors = mapper.selectDirector(id);
//			actors = mapper.selectLeadActor(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.setAttribute("photo", photo);
		request.setAttribute("box", box);

		RequestDispatcher rd = request.getRequestDispatcher("/view/movie/searchMovie.jsp");
		rd.forward(request, response);
	}
}
