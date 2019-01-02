package com.sb.mall.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.home.model.PageListView;
import com.sb.mall.member.service.MemberPagingService;

@Controller
public class MemberListController {
	
	@Autowired
	private MemberPagingService service;
	
	static final int COUNT_PER_PAGE = 10;

	@RequestMapping("/member/memberList")
	public ModelAndView getMemberList(@RequestParam(value="page", defaultValue="1") int pageNumber)
			throws Exception {
		

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");

			modelAndView.setViewName("member/memberList");
			
			PageListView listView = service.getList(pageNumber, COUNT_PER_PAGE, "memberDao");


			modelAndView.addObject("viewData", listView);

		return modelAndView;
	}
	
	
	@RequestMapping("/member/memberListAdd")
	@ResponseBody
	public PageListView getMemberAdd(@RequestParam(value="page", defaultValue="1") int pageNumber)
			throws Exception {
		
		PageListView listView = service.getList(pageNumber, COUNT_PER_PAGE, "memberDao");
		
		return listView;
	}
}