package com.sb.mall.admin.adminOrder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOrder.service.AdminOrderService;
import com.sb.mall.home.model.PageListView;

@Controller
public class ReturnManagerController {

	static final int COUNT_PER_PAGE = 10;

	@Autowired
	AdminOrderService service;

	//loadReturnList ajax
	@RequestMapping(value = "/admin/adminOrder/returnManager/loadReturnList", method = RequestMethod.GET)
	public ModelAndView loadReturnList(@RequestParam(value = "startDate", required = true) String startDate,
			@RequestParam(value = "endDate", required = true) String endDate,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "refund", defaultValue = "1") int refund) {

		ModelAndView modelAndView = new ModelAndView();

		// loadReturnList.jsp 에 넣을 객체를 받아온다.
		PageListView viewData = service.getReturnVOList(startDate, endDate, tableName, pageNumber, COUNT_PER_PAGE, refund);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("admin/adminOrder/returnManager/loadReturnList");

		return modelAndView;
	}
	
//	 반품 상태 업데이트 loadOrderList ajax
	@RequestMapping(value = "/admin/adminOrder/returnManager/loadReturnList/refund/{refund}/{tableName}", method = RequestMethod.POST)
	@ResponseBody
	public String changeRefund(@RequestBody List<Object> orderArray, 
			@PathVariable String refund, @PathVariable String tableName) {
		
		//주문 상태 업데이트
		service.changeRefund(orderArray, refund, tableName);
		
		return "변경 완료!";
	}
		

}
