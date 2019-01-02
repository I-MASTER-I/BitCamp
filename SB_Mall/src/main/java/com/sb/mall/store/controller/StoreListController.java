package com.sb.mall.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.store.service.StoreListViewService;

@Controller
public class StoreListController {
	
	@Autowired
	StoreListViewService storeListViewService;

	@RequestMapping(value="store")
	public ModelAndView storeListView(
			@RequestParam(value="pageNumber",defaultValue="1")int pageNumber,
			HttpSession session
			) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(pageNumber);
		modelAndView.setViewName("view/store/store/storeBoard");
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		modelAndView.addObject("userGrade", memberInfo.getGradeNum());
		return modelAndView;
	}
	
}
