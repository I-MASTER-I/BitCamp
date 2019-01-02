package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.home.model.PageListView;
import com.sb.mall.member.service.MemberPagingService;

@Controller
public class OrderDetailListController {

	@Autowired
	private MemberPagingService service;
	
	static final int COUNT_PER_PAGE = 10;

	@RequestMapping("/order/orderDetailList")
	public ModelAndView getDetailList(@RequestParam(value="page", defaultValue="1") int pageNumber)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");

			modelAndView.setViewName("order/option/orderDetailList");
			
			PageListView listView = service.getList(pageNumber, COUNT_PER_PAGE, "orderDetailDao");


			modelAndView.addObject("viewData", listView);

		return modelAndView;
	}
	

}
