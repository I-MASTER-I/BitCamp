package com.bitcamp.op;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		
		// 세션의 종료
		session.invalidate();
		
		
		
		return "redirect:/";
		
	}
	
	
	
}
