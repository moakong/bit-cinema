//package kr.co.bit_cinema.repository.servlet.movie;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.net.URL;
//import java.net.URLEncoder;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.ibatis.session.SqlSession;
//
//import com.google.gson.Gson;
//
//import common.db.MyAppSqlConfig;
//import kr.co.bit_cinema.repository.mapper.MovieMapper;
//import kr.co.bit_cinema.repository.vo.MovieVO;
//
//@WebServlet("/movie/MovieLoad")
//public class MovieServlet extends HttpServlet {
//
//	private SqlSession session = null;
//	private MovieMapper mapper = null;
//
//	public MovieServlet() {
//		session = MyAppSqlConfig.getSqlSessionInstance();
//		mapper = session.getMapper(MovieMapper.class);
//	}
//
//	@Override
//	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
//		try {
//
//		List<String> movieNames = mapper.selectMovieName();
//		for(String name : movieNames){
//			String eName = URLEncoder.encode(name, "utf-8");
//			String path ="https://apis.daum.net/contents/movie";
//			String param = "?apikey=a6340862d94ed20d649c16aeef2ea7f9&&q=" + eName + "&output=json";
//			URL url = new URL(path + param);
//			
//			InputStream in = url.openStream();
//			InputStreamReader isr = new InputStreamReader(in, "utf-8");
//			BufferedReader br = new BufferedReader(isr);
//			
//			StringBuffer sb = new StringBuffer();
//			while(true){
//				String line = br.readLine();
//				if(line == null)
//					break;
//				sb.append(line);
//			}
//		}
//	
//		System.out.println(sb);
//		MovieVO movie = new Gson().fromJson(sb.toString(), MovieVO.class);
//		
//		List<MovieItem> items = movie.getChannel().getItem();
//		
//		//List<MovieVO> items = movie.getClass()
//		//List<BlogItem> items = blog.getChannel().getItem();
//		List<List<MovieGenre>> genre = new ArrayList<>()
//				;
//		for(MovieItem item : items){
//			List<MovieGenre> temp = item.getGenre();
//			genre.add(temp);
//		}
//		System.out.println("===========================");
//		for(List<MovieGenre> mgs : genre){
//			for(MovieGenre mg : mgs){
//				System.out.println(mg.getContent());
//			}
//		}
//		System.out.println("===========================");
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//	
//
//}
