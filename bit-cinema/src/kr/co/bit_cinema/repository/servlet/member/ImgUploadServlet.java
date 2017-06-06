package kr.co.bit_cinema.repository.servlet.member;

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

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/member/ImgUpload")
public class ImgUploadServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/img/member");

		File f = new File(uploadPath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				uploadPath,
				1024 * 1024 * 10,
				"utf-8",
				new BitFileRenamePolicy()
		);
		
		Enumeration<String> fNames = multi.getFileNames();
		String sysName = null;
		while(fNames.hasMoreElements()){
			String fileName = fNames.nextElement();
			File file = multi.getFile(fileName);
			if(file != null){
				sysName = multi.getFilesystemName(fileName);
			}
		}
		
		request.setAttribute("img", sysName);
		RequestDispatcher rd = request.getRequestDispatcher("/view/member/imgUpload.jsp");
		rd.forward(request, response);
	}

}
