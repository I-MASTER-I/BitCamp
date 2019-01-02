package com.sb.mall.order.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderCartParam;
import com.sb.mall.order.model.OrderOrderCommand;
import com.sb.mall.order.service.OrderCartService;

@Controller
public class OrderCartController {

	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value = "order/carts", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> viewCartList(int userSeq) {
		List<Map<String,Object>> list = new ArrayList<>();
		try {
			list=orderCartService.selectCarts(userSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value = "order/carts/insert", method = RequestMethod.POST)
	@ResponseBody
	public String addCart(OrderOrderCommand orderCommand) {
		ObjectMapper jackson = new ObjectMapper();
		OrderCartParam orderCartParam = new OrderCartParam();
		String msg = "";
		try {
			Map<String, List<Order>> map = new HashMap<>();
			map.put("orders", orderCommand.getOrders());
			String orders = jackson.writeValueAsString(map);
			orderCartParam.setOrders(orders);
			msg=orderCartService.addCart(orderCartParam);
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
			return "400";
		}
		return msg;
	}

	@RequestMapping(value = "order/carts/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCart(OrderOrderCommand orderCommand) {
		List<Order> list = orderCommand.getOrders();
		try {
			orderCartService.deleteCart(list);
		} catch (SQLException e) {
			e.printStackTrace();
			return "장바구니 삭제에 실패하였습니다";
		}
		return "장바구니 삭제에 성공하였습니다";
	}

	@RequestMapping(value = "order/cart/{userSeq}/update", method = RequestMethod.POST)
	public ModelAndView viewCart(@PathVariable("userSeq") int userSeq,Order order) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
}
