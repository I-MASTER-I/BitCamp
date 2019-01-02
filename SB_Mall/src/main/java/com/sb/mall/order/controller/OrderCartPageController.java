package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sb.mall.order.service.OrderCartService;

@Controller
public class OrderCartPageController {
	
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value="order/cart", method=RequestMethod.GET)
	public String viewCartList() {
		return "view/orderCart";
	}
	
}
