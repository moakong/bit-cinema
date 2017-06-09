package kr.co.bit_cinema.repository.servlet.review;

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
import kr.co.bit_cinema.repository.mapper.ReviewMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.ReviewVO;

@WebServlet("/write")
public class write extends HttpServlet{
	
	SqlSession sqlsession ;
	ReviewMapper mapper;
	MovieMapper mapperMovie;
	public write(){
		sqlsession = MyAppSqlConfig.getSqlSessionInstance();
		mapper = sqlsession.getMapper(ReviewMapper.class); 
		mapperMovie = sqlsession.getMapper(MovieMapper.class); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content =request.getParameter("content");
		int spoiler = Integer.parseInt(request.getParameter("spo")) ;
		int mid = Integer.parseInt(request.getParameter("mid"));
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		
		ReviewVO vo = new ReviewVO();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setSpoiler(spoiler);
		vo.setMemberId(user.getMemberId());
		vo.setMovieId(mid);
		
		
		try {
			 mapper.insertReview(vo);
			sqlsession.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("mid",mid);
		
		RequestDispatcher rd = request.getRequestDispatcher("view/review/write.jsp");
		
		rd.forward(request, response);
	
	}

}
