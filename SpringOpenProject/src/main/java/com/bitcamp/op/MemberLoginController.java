package com.bitcamp.op;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.op.member.service.MemberLoginService;

@Controller
@RequestMapping("/member/login")
public class MemberLoginController {
	
	@Autowired
	private MemberLoginService loginService;
	

	//@RequestMapping("/member/login")
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getLoginForm(
			@RequestParam(value="no", required=false) String num) {
		
		return new ModelAndView("member/loginForm");
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView loginProcess(
			@RequestParam(value="userId", required=false) String userId, 
			@RequestParam(value="password", required=false) String password,
			HttpSession session
			) throws SQLException {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("member/loginFail");
		
		if (userId != null && password != null) {
			
			if(loginService.login(userId, password, session)) {
				modelAndView.setViewName("redirect:/");
			}
			
			
			
			
			
		} 
		
		return modelAndView;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
