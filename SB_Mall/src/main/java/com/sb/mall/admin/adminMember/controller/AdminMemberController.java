package com.sb.mall.admin.adminMember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminMember.service.AdminMemberService;

@Controller
public class AdminMemberController {
	
	@Autowired
	AdminMemberService service;
	
	//주문 페이지 불러오기
		@RequestMapping(value="/admin/adminMember", method=RequestMethod.GET)
		public ModelAndView main() {
			
			ModelAndView modelAndView = new ModelAndView();
				modelAndView.setViewName("admin/adminMember");
				
			//상단 메뉴 버튼 활성화
			modelAndView.addObject("adminMember", "active");
			
			return modelAndView;
		}
		
		//주문 각 페이지 컨트롤러
		@RequestMapping(value="/admin/adminMember/{page}", method=RequestMethod.GET)
		public ModelAndView adminOrderPage(@PathVariable String page) {
			
			ModelAndView modelAndView = new ModelAndView();
				modelAndView.setViewName("admin/adminMember/" + page);
			
			return modelAndView;
		}
}

