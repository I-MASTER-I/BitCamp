package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.order.model.OrderItemList;
import com.sb.mall.order.service.OrderCartService;
import com.sb.mall.order.service.OrderService;

@Controller
public class OrderPageController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value="order/order", method=RequestMethod.POST)
	public ModelAndView orderCartList(OrderItemList orderItemList) {
		ModelAndView modelAndView = new ModelAndView();
		ObjectMapper jackson = new ObjectMapper();
		String json = "";
		try {
			json =jackson.writeValueAsString(orderItemList.getOrders());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		modelAndView.addObject("orders", orderItemList.getOrders());
		modelAndView.addObject("orderType", orderItemList.getOrderType());
		modelAndView.addObject("ordersJson",json);
		modelAndView.setViewName("order/orderDetailPage");
		return modelAndView;
	}
	
	@RequestMapping(value="order/order" ,method=RequestMethod.GET)
	public String order() {
		return "redirect:/store";
	}
	
}
