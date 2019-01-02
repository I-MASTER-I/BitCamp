package com.sb.mall.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.order.model.Order;
import com.sb.mall.order.service.OrderService;

@Controller
public class OrderListController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/order/orderList/{orderDetailNum}")
	public ModelAndView orderDetail(@PathVariable("orderDetailNum") String orderDetailNum) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");
		
		List<Order> orders = orderService.getOrderByDetailNum(orderDetailNum);
		
		modelAndView.setViewName("order/option/orderList");
		
		modelAndView.addObject("orders", orders);

		return modelAndView;
	}
	

}
