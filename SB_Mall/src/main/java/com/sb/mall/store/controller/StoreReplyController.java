package com.sb.mall.store.controller;

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

import com.sb.mall.store.service.StoreReplyService;

@Controller
public class StoreReplyController {
	
	@Autowired
	private StoreReplyService replyService;
	
	@RequestMapping("/reply")
	public ModelAndView getReplycnt(HttpServletRequest request,
			@RequestParam(value="page", defaultValue="1")int nowPage) throws IOException{
		
		ModelAndView modelAndView = new ModelAndView();
		
		String url= request.getHeader("referer");
		String[] urlArr = url.split("/");
		int salesSeq = Integer.parseInt(urlArr[urlArr.length-1]);
		
		int pageCount;
		System.out.println("session : "+request.getSession().getAttribute("memberInfo"));
		
		System.out.println("nowPage : "+nowPage);
		
		List<Map<String, Object>> replyList = new ArrayList<Map<String, Object>>();
		
		
		replyList= replyService.getReplys(salesSeq,nowPage);
		pageCount = replyService.getReplyCount(salesSeq);
		
		modelAndView.addObject("replyList", replyList);
		modelAndView.addObject("userSession", request.getSession().getAttribute("memberInfo"));
		modelAndView.addObject("pageCnt", pageCount);
		modelAndView.addObject("nowPage", nowPage);
		modelAndView.setViewName("store/store/replyReturn");
		
		
		return modelAndView;
	}

	

}
