package com.sb.mall.crowd.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.crowd.model.CrowdOrder;
import com.sb.mall.crowd.model.CrowdOrderCommand;
import com.sb.mall.crowd.service.CrowdOrderService;
import com.sb.mall.member.service.AES256Util;

@Controller
public class CrowdOrderDetailController {
	
	@Autowired
	private CrowdOrderService orderService;
	
	
	
	@RequestMapping(value="/crowd/crowdOrderDetail", method=RequestMethod.POST)
	public ModelAndView orderDetail(CrowdOrderCommand orderCommand) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		ModelAndView modelAndView = new ModelAndView("store/crowdFunding/crowdError");
		
		int check = orderService.insertOrder(orderCommand.getOrderList(), orderCommand.getOrderDetail());
		
		if(check==1) {
			modelAndView.setViewName("view/store/crowdFunding/crowdBoard");
		}
		
		return modelAndView;
	}
}
