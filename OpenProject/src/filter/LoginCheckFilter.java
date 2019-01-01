package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		
		// 세션 객체 확인
		HttpSession session = httpServletRequest.getSession(false);
		
		
		boolean loginCheck = false;
		
		if(session != null) {
			if(session.getAttribute("loginInfo") != null) {
				loginCheck = true;
			}
		}
		
		if(loginCheck) {
			chain.doFilter(request, response);
		} else {
			servletResponse.sendRedirect(httpServletRequest.getContextPath()+"/loginForm.jsp");
		}
		
		
		
	}

	
	
	
	
	
	
	

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
