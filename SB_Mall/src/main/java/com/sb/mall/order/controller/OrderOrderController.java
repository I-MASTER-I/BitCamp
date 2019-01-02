package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.order.model.OrderCartParam;
import com.sb.mall.order.service.OrderService;

@Controller
public class OrderOrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="order/orders/insert",method=RequestMethod.POST)
	@ResponseBody
	public String order(OrderCartParam orderCartParam) {
		return orderService.insertOrders(orderCartParam); 
	}
	
}
