package com.sb.mall.admin.adminCalendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCalendarController {
	
	@RequestMapping(value="/admin/adminCalendar", method=RequestMethod.GET)
	public ModelAndView adminCalendar() {
		
		ModelAndView modelAndView = new ModelAndView("/admin/adminCalendar");
		
		//상단 메뉴 버튼 활성화
		modelAndView.addObject("adminCalendar", "active");
		
		return modelAndView;
	}

}

