package com.sb.mall.home.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sb.mall.home.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws SQLException {
		
		Date date = new Date();
		List<Map<String, Object>> dailyList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> newProductList = new ArrayList<Map<String, Object>>();
		
		dailyList = homeService.getCrowdFunding();
		
		newProductList = homeService.getNewProduct();
		
		
		
//	SimpleDateFormat Time = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat getHour = new SimpleDateFormat("HH");
		SimpleDateFormat getMin = new SimpleDateFormat("mm");
		SimpleDateFormat getSec = new SimpleDateFormat("ss");
		
		
		model.addAttribute("crowdHome", dailyList);
		model.addAttribute("newProduct", newProductList);
		
		model.addAttribute("hour", getHour.format(date) );
		model.addAttribute("min", getMin.format(date) );
		model.addAttribute("sec", getSec.format(date) );
		
		return "view/home";
	}
	
}
