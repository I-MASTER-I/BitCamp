package com.sb.mall.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle( // 컨트롤러 실행전 :등록된 순서대로 preHandle() 실행
			HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// 세션에 로그인 정보 유부 확인
		// -> return true : 정상적인 Controller 실행!

		HttpSession session = request.getSession(false);

		if (session != null) {

			Object obj = session.getAttribute("memberInfo");

			if (obj != null) {
				return true;
			}

		}

		response.sendRedirect(request.getContextPath() + "/error/loginError");

		return false;
	}

}
