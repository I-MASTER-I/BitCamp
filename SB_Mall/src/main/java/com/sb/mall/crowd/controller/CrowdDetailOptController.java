package com.sb.mall.crowd.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.service.CrowdDetailOptService;

@Controller
public class CrowdDetailOptController {
	
	@Autowired
	private CrowdDetailOptService optService;
	
	@ResponseBody
	@RequestMapping("crowd/detail/opt1")
	public ModelAndView getOpt1(
			@RequestParam(value="goodsNo")String goodsNo,
			@RequestParam(value="ProSeq")int ProSeq) {
				
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, Object>> opt1List = new ArrayList<Map<String, Object>>();
		
		opt1List = optService.getOpt1(goodsNo);
		
		modelAndView.addObject("opt1List", opt1List);
		modelAndView.setViewName("store/crowdFunding/option/crowdDetailOption1");
		
		return modelAndView;
	}
	
	
	@ResponseBody
	@RequestMapping("crowd/detail/opt2")
	public ModelAndView getOpt2(
			@RequestParam(value="goodsNo")String goodsNo,
			@RequestParam(value="opt1Name")String opt1Name) {
				
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, Object>> opt2List = new ArrayList<Map<String, Object>>();
		
		opt2List = optService.getOpt2(goodsNo,opt1Name);
		
		modelAndView.addObject("opt2List", opt2List);
		modelAndView.setViewName("store/crowdFunding/option/crowdDetailOption2");
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
}
