package com.sb.mall.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sb.mall.member.model.MemberInfo;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle( // 컨트롤러 실행전 :등록된 순서대로 preHandle() 실행
			HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// 세션에 로그인 정보 유부 확인
		HttpSession session = request.getSession(false);

		if (session != null) {

			MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");

			if (memberInfo != null && memberInfo.getGradeNum() >= 3) {
				return true;
			}
		}

		response.sendRedirect(request.getContextPath() + "/admin/adminLogin");

		return false;
	}

}
