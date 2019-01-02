package com.sb.mall.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.home.model.PageListView;
import com.sb.mall.member.service.MemberOrderListService;

@Controller
public class MemberOrderListController {

	static final int COUNT_PER_PAGE = 10;

	@Autowired
	MemberOrderListService service;

	// myPage에 주문 목록 불러오기
	@RequestMapping(value = "/member/loadOrderDetailList", method = RequestMethod.GET)
	public ModelAndView getOrderDetailVOList(@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "userSeq", required = true) int userSeq) {

		ModelAndView modelAndView = new ModelAndView();

		PageListView viewData = service.getOrderDetailVOList(pageNumber, COUNT_PER_PAGE, tableName, userSeq);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("member/loadOrderDetailList");

		return modelAndView;
	}

	// myPage에 주문 상세 목록 불러오기
	@RequestMapping(value = "/member/loadOrderList", method = RequestMethod.GET)
	public ModelAndView getOrderVOList(@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "orderDetailNum", required = true) String orderDetailNum) {

		ModelAndView modelAndView = new ModelAndView();

		List<Object> orderVOList = new ArrayList<>();

		orderVOList = service.getOrderVOList(tableName, orderDetailNum);

		modelAndView.addObject("orderVOList", orderVOList);

		modelAndView.setViewName("member/loadOrderList");

		return modelAndView;
	}

	// 반품상태 업데이트 및 OrderDetail의 totalAmount 변경
	@RequestMapping(value = "/member/changeRefund", method = RequestMethod.GET)
	@ResponseBody
	public String changeRefund(@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "orderSeq", required = true) int orderSeq,
			@RequestParam(value = "refund", defaultValue = "0") int refund,
			@RequestParam(value = "orderDetailNum", required = true) String orderDetailNum) {

		service.changeRefund(tableName, orderSeq, refund, orderDetailNum);
		
		return "변경 완료!";
	}

}
