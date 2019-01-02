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

import com.sb.mall.crowd.service.CrowdBoardService;

@Controller
public class CrowdBoardListController {
	
	@Autowired
	private CrowdBoardService boardService;

	@RequestMapping("crowd/crowdBoardList")
	@ResponseBody
	public ModelAndView getCrowdBoard(
						@RequestParam(value="nowPage", defaultValue="1")int nowPage, 
						@RequestParam(value="pageShowCnt", defaultValue="15")int pageShowCnt){
		System.out.println("게시판 가져오는 컨트롤러 입장.");
		ModelAndView modelAndView = new ModelAndView();
		
		List<Map<String, Object>> list= new ArrayList<Map<String, Object>>();
		list = boardService.getCrowdBoard(nowPage, pageShowCnt);
		System.out.println("게시판 get");
		System.out.println("List.Length : "+list.size());
		
		int paging = boardService.getBoardPageCnt(pageShowCnt);
		int doAdd = 0;
		if(list.size()%3!=0) {
			doAdd = 3-list.size()%3;
		}
		
		System.out.println("doAdd : "+doAdd);
		modelAndView.addObject("boardList", list);
		modelAndView.addObject("paging", paging);
		modelAndView.addObject("nowPage", nowPage);
		System.out.println("nowPage : "+nowPage+", paging : "+paging);
		modelAndView.addObject("doAdd", doAdd);
		modelAndView.setViewName("store/crowdFunding/option/crowdBoardOption");
		
		return modelAndView;
	}
}
