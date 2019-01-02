package com.sb.mall.admin.adminOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminOperationController {
	
	//총 영업 현황 불러오기
	@RequestMapping(value="/admin/adminOperation", method=RequestMethod.GET)
	public ModelAndView main() {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminOperation");
			
		//상단 메뉴 버튼 활성화
		modelAndView.addObject("adminOperation", "active");
		
		return modelAndView;
	}
	
	//영업관리 페이지 컨트롤러 - totalReport salReport dailySal monthlySal weeklySal hourSal budget
	@RequestMapping(value="/admin/adminOperation/{page}", method=RequestMethod.GET)
	public ModelAndView operationPage(@PathVariable String page) {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminOperation/" + page);
		
		return modelAndView;
	}
	

}

