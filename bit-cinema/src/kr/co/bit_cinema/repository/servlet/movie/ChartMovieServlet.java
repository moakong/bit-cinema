package kr.co.bit_cinema.repository.servlet.movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.vo.movie.MovieVO;

@WebServlet("/movie/ChartMovie")
public class ChartMovieServlet extends HttpServlet {
	
	private SqlSession session = null;
	private MovieMapper mapper = null;
	
	public ChartMovieServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MovieMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String pass = request.getParameter("pass");
		int chart = Integer.parseInt(request.getParameter("chart"));
		List<MovieVO> chartMovie = null;
		try {
			if (chart == 1) {
				chartMovie = mapper.boxMovie();
			} else {
				chartMovie = mapper.reserMovie();
			}
			
			PrintWriter out = response.getWriter();
			
			String json = "";
			json += "[";
			for(int i=0;i<chartMovie.size();i++){
				json += "  {";
				json += "    \"id\": \""+ chartMovie.get(i).getMovieId() +"\",";	
				json += "    \"name\": \""+ chartMovie.get(i).getMovieName() +"\"}";
				if(i != chartMovie.size()-1)
					json += ",";
			}
			json += "]";
			out.println(json);
			out.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
