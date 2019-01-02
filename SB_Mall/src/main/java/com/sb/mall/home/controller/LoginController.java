package com.sb.mall.home.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.service.AES256Util;
import com.sb.mall.member.service.MemberLoginService;

@Controller // 클라이언의 요청을 처리 한 뒤그 결과를 DispatcherServlet에게 알려 줌 Struts의 Action과 동일한 기능
public class LoginController {

	@Autowired // Spring Framework에서 지원하는 의존주입 용도의 어노테이션
	private MemberLoginService loginService;
	
	/*3.암호화 관련 의존주입 2018.11.16*/
	@Autowired
	private AES256Util aes256;
	
	// 요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
	@RequestMapping(value = "/member/login", method = RequestMethod.GET) // url 주소
	// 쿠키 값 저장
	public ModelAndView getLoginForm(@CookieValue(value = "idcookie", required = false) String rememberId) {
		// ModelAndView 객체 생성
		ModelAndView modelAndView = new ModelAndView();
		// loginForm으로 보내줌
		modelAndView.setViewName("view/loginForm");
		modelAndView.addObject("idcookie", rememberId);

		return modelAndView;

	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	// id,pw ,session,cookie 값 받아온다
	public ModelAndView loginProcess(@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "userPw", required = false) String userPw,
			@RequestParam(value = "rememberId", required = false) String rememberId, HttpSession session,
			HttpServletResponse response

	) throws SQLException, NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

		ModelAndView modelAndView = new ModelAndView();

		// 아이디저장 버튼이 on일 경우 쿠키생성
		if ("on".equals(rememberId)) {
			response.addCookie(new Cookie("idcookie", userId));

		}

		// userId 또는 userPw가 null 이 아닌 경우 
		if (userId != null && userPw != null) {
			
			/*2018.11.16 암호화 패치*/
			String encryptionPW = aes256.encrypt(userPw);
			userPw = (encryptionPW);
			
			if (loginService.login(userId, userPw, session)) {
				
				
				modelAndView.setViewName("redirect:/");
			} else {
				modelAndView.setViewName("view/loginForm"); // 경로
				modelAndView.addObject("error", "아이디 또는 비밀번호가 틀렸습니다.");
			}

		}

		return modelAndView;
	}

	@RequestMapping("/error/loginError")
	public String loginError() {
		return "error/loginError";
	}

	@RequestMapping("/member/logout") // 요청한 주소로 들어온다
	public String logout(HttpSession session) {

		// 세션의 종료
		session.invalidate();

		return "redirect:/";

	}

}
