package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.order.model.OrderDetail;
import com.sb.mall.order.service.OrderDetailStatusService;

@Controller
public class OrderDetailStatusController {

	@Autowired
	private OrderDetailStatusService service;

	@RequestMapping("/order/orderDetailStatus/{orderDetailNum}")
	@ResponseBody
	public OrderDetail orderDetail(@PathVariable("orderDetailNum") String orderDetailNum) throws Exception {

		OrderDetail orderDetail;

		orderDetail = service.getOrderDetail(orderDetailNum);

		return orderDetail;
	}

}
