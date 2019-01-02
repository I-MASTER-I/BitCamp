package com.sb.mall.crowd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.model.CrowdWriteCommand;
import com.sb.mall.crowd.service.CrowdWriteService;

@Controller
@RequestMapping("crowd/crowdWritePage")
public class CrowdWriteController {
	
	@Autowired
	private CrowdWriteService WriteSv;
	
	@RequestMapping(method=RequestMethod.GET)
	public String crowdWriteForm() {
		System.out.println("crowdWrite입장");
		return "store/crowdFunding/crowdWritePage";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView crowdWrite(CrowdWriteCommand crowdWriteCommand) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println(crowdWriteCommand);
		boolean result = WriteSv.insertCrowdCommand(crowdWriteCommand);
		
		if(result) {
			System.out.println("게시글 등록 성공, 펀딩 게시판으로 이동합니다.");
			modelAndView.setViewName("redirect:/crowd/crowdBoard");
		}
		
		
		return modelAndView;
	}
}
