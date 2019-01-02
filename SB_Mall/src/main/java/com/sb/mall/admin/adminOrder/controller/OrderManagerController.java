package com.sb.mall.admin.adminOrder.controller;

import java.util.ArrayList;
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

import com.sb.mall.admin.adminOrder.model.OrderBackVO;
import com.sb.mall.admin.adminOrder.model.OrderVO;
import com.sb.mall.admin.adminOrder.service.AdminOrderService;
import com.sb.mall.home.model.PageListView;

@Controller
public class OrderManagerController {

	static final int COUNT_PER_PAGE = 10;

	@Autowired
	AdminOrderService service;

	// 일별 주문현황 loadOrderList ajax
	@RequestMapping(value = "/admin/adminOrder/orderManager/loadOrderList", method = RequestMethod.GET)
	public ModelAndView loadDailySalReport(@RequestParam(value = "startDate", required = true) String startDate,
			@RequestParam(value = "endDate", required = true) String endDate,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "status", defaultValue = "-1") int status,
			@RequestParam(value = "payment", defaultValue = "-1") int payment,
			@RequestParam(value = "search", defaultValue = "") String search) {

		ModelAndView modelAndView = new ModelAndView();

		// dailySal.jsp 에 넣을 객체를 받아온다.
		PageListView viewData = service.getOrderDetailVOList(startDate, endDate, tableName, pageNumber,
				COUNT_PER_PAGE, status, payment, search);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("admin/adminOrder/orderManager/loadOrderList");

		return modelAndView;
	}
	
	// 주문 상세내역 orderResult ajax
	@RequestMapping(value = "/admin/adminOrder/orderManager/loadOrderList/orderResult", method = RequestMethod.POST)
	public ModelAndView orderResult(@RequestBody OrderBackVO orderBackVO) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		//주문정보리스트를 가져온다.
		List<OrderVO> orderVOList = new ArrayList<>();
		
		orderVOList = service.getOrderVOList(orderBackVO);
		
		modelAndView.addObject("orderVOList", orderVOList);
		
		//뒤로가기 위한 정보
		modelAndView.addObject("OrderBackVO", orderBackVO);
		
		modelAndView.setViewName("admin/adminOrder/orderManager/loadOrderList/orderResult");
		
		return modelAndView;
	}
	
	// 주문 상태 업데이트 loadOrderList ajax
	@RequestMapping(value = "/admin/adminOrder/orderManager/loadOrderList/changeStatus/{status}/{tableName}", method = RequestMethod.POST)
	@ResponseBody
	public String changeStatus(@RequestBody List<Object> orderDetailArray, 
			@PathVariable String status, @PathVariable String tableName) {
		
		//주문 상태 업데이트
		service.changeStatus(orderDetailArray, status, tableName);
		
		return "변경 완료!";
	}
	
	

}
