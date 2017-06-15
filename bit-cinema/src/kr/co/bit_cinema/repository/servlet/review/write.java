package kr.co.bit_cinema.repository.servlet.review;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.db.MyAppSqlConfig;
import kr.co.bit_cinema.repository.mapper.MovieMapper;
import kr.co.bit_cinema.repository.mapper.ReviewMapper;
import kr.co.bit_cinema.repository.vo.MemberVO;
import kr.co.bit_cinema.repository.vo.ReviewFileVO;
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
		//파일
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		uploadPath += datePath;
		
		File f = new File(uploadPath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		MultipartRequest mrequest = new MultipartRequest(
				request, uploadPath,
				1024*1024*10, "utf-8",
				new DefaultFileRenamePolicy()
				);
		
		
		
		response.setCharacterEncoding("utf-8");
		String title = mrequest.getParameter("title");
		String content =mrequest.getParameter("content");
		int spoiler = Integer.parseInt(mrequest.getParameter("spo")) ;
		int mid = Integer.parseInt(mrequest.getParameter("mid"));
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		
		ReviewVO vo = new ReviewVO();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setSpoiler(spoiler);
		vo.setMemberId(user.getMemberId());
		vo.setMovieId(mid);
		
		
		
		try {
			// 글 db 저장
			 mapper.insertReview(vo);
			sqlsession.commit();
			
			
			//파일 db 저장
			Enumeration<String> fname = mrequest.getFileNames();
			System.out.println("파일  : " +fname);
			
				while(fname.hasMoreElements()){
					String filename = fname.nextElement();
					File f2 = mrequest.getFile(filename);
					System.out.println("파일 이름 : " +filename);
					System.out.println("파일 클래스 : " +f2);
					
					if(f2 != null){
					long fileSize = f2.length();
					int reviewNo = vo.getReviewNo();
					String oriName = mrequest.getOriginalFileName(filename);
					String sysName = mrequest.getFilesystemName(filename);
					
					ReviewFileVO reFile = new ReviewFileVO();
					reFile.setReviewNo(reviewNo);
					reFile.setFileSize(fileSize);
					reFile.setFilePath(datePath);
					reFile.setOriName(oriName);
					reFile.setSysName(sysName);
					
					mapper.insertFile(reFile);
					sqlsession.commit();
					}
				}
			
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("mid",mid);
		
		RequestDispatcher rd = request.getRequestDispatcher("/review/Review?id="+mid);
		rd.forward(request, response);
	
	}

}
