package com.sb.mall.crowd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.service.CrowdReplyService;

@Controller
public class CrowdReplyController {
	
	@Autowired
	private CrowdReplyService RService;
	
	@RequestMapping("crowd/reply")
	public ModelAndView getCrReplycnt(HttpServletRequest request,
			@RequestParam(value="page", defaultValue="1")int nowPage) throws IOException{
		System.out.println("crowdReply입장");
		ModelAndView modelAndView = new ModelAndView();
		
		String url= request.getHeader("referer");
		String[] urlArr = url.split("/");
		int ceBoardSeq = Integer.parseInt(urlArr[urlArr.length-1]);
		
		int pageCount;
		List<Map<String, Object>> replyList = new ArrayList<Map<String, Object>>();
		
		
		replyList= RService.getReplys(ceBoardSeq,nowPage);
		pageCount = RService.getReplyCount(ceBoardSeq);
		
		modelAndView.addObject("replyList", replyList);
		modelAndView.addObject("userSession", request.getSession().getAttribute("memberInfo"));
		modelAndView.addObject("pageCnt", pageCount);
		modelAndView.addObject("nowPage", nowPage);
		modelAndView.setViewName("store/crowdFunding/option/crowdReplyReturn");
		
		
		return modelAndView;
	}
}
