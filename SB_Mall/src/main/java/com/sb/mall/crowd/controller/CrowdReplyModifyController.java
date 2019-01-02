package com.sb.mall.crowd.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.model.CrowdReply;
import com.sb.mall.crowd.service.CrowdReplyModifyService;
import com.sb.mall.store.model.Reply;
import com.sb.mall.store.service.StoreReplyModifyService;

@Controller
@RequestMapping("crowd/reply/modify")
public class CrowdReplyModifyController {
	
	@Autowired
	private CrowdReplyModifyService modifyService;
	
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getReplyForm(@RequestParam(value="replySeq")int replySeq) {
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, Object>> replyModify = modifyService.getReplyByreqSeq(replySeq);
		
		modelAndView.addObject("replyModify", replyModify);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST)
	public String orderReplyUpdate(CrowdReply replyModify) {
		String result = "실패";
		int done = modifyService.setReplyUpdate(replyModify);
		System.out.println(replyModify);
		if(done==1) {
			result="성공";
		}
		System.out.println("댓글 수정 : "+result);
		
		return result;
		
	}
}
