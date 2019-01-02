package com.sb.mall.store.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.service.MemberPagingService;
import com.sb.mall.store.model.StoreListView;
import com.sb.mall.store.service.StoreListViewService;

@Controller
public class StoreListViewController {
	
	@Autowired
	StoreListViewService storeListViewService;
	
	@Autowired
	MemberPagingService getPagingService;
	
	
	@RequestMapping("store/boardListView")
	@ResponseBody
	public ModelAndView getListView(String tag,
		@RequestParam(value="sortType",defaultValue="s.viewSeq desc") String sortType,
		@RequestParam(value="pageNumber",defaultValue="1") int pageNumber,
		@RequestParam(value="countPerPage",defaultValue="9") int countPerPage){
		ModelAndView modelAndView = new ModelAndView();
		try {
			StoreListView list = 
					getPagingService.getStoreList(pageNumber, countPerPage, 
							"StoreListView", tag, sortType);
			modelAndView.addObject("viewList", list);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "글 목록 조회에 실패하였습니다.");
			System.out.println("글 목록 조회에 실패하였습니다.");
		}
		modelAndView.setViewName("store/store/include/boardListView");
		return modelAndView;
	}

}
