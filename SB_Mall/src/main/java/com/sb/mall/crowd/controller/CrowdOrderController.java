package com.sb.mall.crowd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.model.CrowdOrderCommand;
import com.sb.mall.crowd.model.CrowdOrderList;
import com.sb.mall.crowd.service.CrowdOrderService;
import com.sb.mall.member.model.MemberInfo;

@Controller
public class CrowdOrderController {
	
	@Autowired
	private CrowdOrderService orderService;
	
	@RequestMapping(value="/crowd/crowdOrder", method=RequestMethod.POST)
	public ModelAndView orderForm(CrowdOrderList orderList, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		int totalAmount = 0;
		
		for (int i=0; i<orderList.getOrders().size(); i++) {
			String userName = orderService.getUserName(orderList.getOrders().get(i).getUserSeq());
			orderList.getOrders().get(i).setUserName(userName);
			
			totalAmount += orderList.getOrders().get(i).getSalePrice();
		}
		
		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		System.out.println(memberInfo);
		modelAndView.addObject("orderList", orderList);
		modelAndView.addObject("totalAmount", totalAmount);
		modelAndView.addObject("memberInfo", memberInfo);
		modelAndView.setViewName("store/crowdFunding/crowdOrder");
		
		
		return modelAndView;
	}
	
	
	
	
}
