package kr.co.bit_cinema.repository.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter {
	private String charset;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// POST 방식일 경우 적용
		HttpServletRequest hRequest = (HttpServletRequest)request;
		String method = hRequest.getMethod();
		if ("POST".equals(method)) {
			request.setCharacterEncoding(charset);
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}
	
}









