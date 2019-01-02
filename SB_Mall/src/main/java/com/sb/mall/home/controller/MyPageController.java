package com.sb.mall.home.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.MemberMypageService;
import com.sb.mall.member.service.MemberOrderListService;

@Controller
@SessionAttributes("memberInfo")
public class MyPageController {

	@Autowired
	MemberMypageService mypageService;
	
	@Autowired
	MemberOrderListService service;

	@RequestMapping("member/myPage")
	public ModelAndView myPage(HttpSession session, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("view/myPage");

		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
//		int userSeq = memberInfo.getUserSeq();
		String userId = memberInfo.getUserId();


		memberInfo = mypageService.getMemberInfo(userId);
		
		modelAndView.addObject("memberInfo", memberInfo);

		return modelAndView;
	}

}
