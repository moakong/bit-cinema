package kr.co.bit_cinema.repository.servlet.movie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.vo.GenreVO;
import kr.co.bit_cinema.repository.vo.MovieVO;
import kr.co.bit_cinema.repository.vo.PhotoVO;

@WebServlet("/movie/LoadMovie")
public class MovieServlet extends HttpServlet {

	SqlSession session = null;
	MovieMapper mapper = null;

	public MovieServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(MovieMapper.class);
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<MovieVO> mTitle = mapper.selectTitle();
			System.out.println("ㅇㅇ?");
			System.out.println(mTitle);
			for (MovieVO m : mTitle) {
				String path = "https://apis.daum.net/contents/movie";
				String mn = URLEncoder.encode(m.getMovieName(), "utf-8");
				String param = "?apikey=a6340862d94ed20d649c16aeef2ea7f9&&q=" + mn + "&output=json";
				URL url = new URL(path + param);
System.out.println(m.getMovieName());
				InputStream in = url.openStream();
				InputStreamReader isr = new InputStreamReader(in, "utf-8");
				BufferedReader br = new BufferedReader(isr);
				StringBuffer sb = new StringBuffer();
				while (true) {
					String line = br.readLine();
					if (line == null)
						break;
					sb.append(line);
				}

				Movie movieGson = new Gson().fromJson(sb.toString(), Movie.class);
				List<MovieItem> items = movieGson.getChannel().getItem();
				List<List<EngTitle>> engTitle = new ArrayList<>();
				List<List<OpenInfo>> openInfo = new ArrayList<>();
				List<List<MovieGenre>> genre = new ArrayList<>();
				List<List<Story>> story = new ArrayList<>();
				List<List<Audience>> audience = new ArrayList<>();
				List<List<AudienceDate>> audDate = new ArrayList<>();
				List<List<Thumbnail>> thumbnail = new ArrayList<>();
				List<MovieGenre> t1 = items.get(0).getGenre();
				List<OpenInfo> t2 = items.get(0).getOpen_info();
				List<EngTitle> t3 = items.get(0).getEng_title();
				List<Story> t4 = items.get(0).getStory();
				List<Audience> t5 = items.get(0).getAudience();
				List<AudienceDate> t6 = items.get(0).getAudience_date();
				List<Thumbnail> t7 = items.get(0).getThumbnail();
				genre.add(t1);
				openInfo.add(t2);
				engTitle.add(t3);
				story.add(t4);
				audience.add(t5);
				audDate.add(t6);
				thumbnail.add(t7);
				MovieVO movie = new MovieVO();
				movie.setMovieId(m.getMovieId());
				movie.setEngTitle(engTitle.get(0).get(0).getContent());
				//List<String> g = new ArrayList<>();
				for (List<MovieGenre> mgs : genre) {
					GenreVO g = new GenreVO();
					g.setMovieId(m.getMovieId());
					for (MovieGenre mg : mgs) {
						//g.add(mg.getContent());
						g.setGenre(mg.getContent());
						mapper.loadGenre(g);
					}
				}
				//movie.setGenre(g);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				movie.setReleaseDate(sdf.parse(openInfo.get(0).get(0).getContent()));
				movie.setCertificate(openInfo.get(0).get(1).getContent());
				movie.setRuntime(openInfo.get(0).get(2).getContent());
				movie.setStory(story.get(0).get(0).getContent());
				PhotoVO photo = new PhotoVO();
				photo.setMovieId(m.getMovieId());
				photo.setRoute(thumbnail.get(0).get(0).getContent());
				photo.setType("thumbnail");
				
				mapper.loadMovie(movie);
				mapper.loadThumb(photo);
				session.commit();
			}
			
			response.sendRedirect(request.getContextPath() + "/main/Main");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
