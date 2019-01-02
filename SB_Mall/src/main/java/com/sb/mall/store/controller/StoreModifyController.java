package com.sb.mall.store.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sb.mall.store.model.SalesBoard;
import com.sb.mall.store.service.StoreAdminService;

@Controller
@RequestMapping("store/ModifyBoard")
public class StoreModifyController {
	
	@Autowired
	StoreAdminService storeAdminService;

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView modifyBoard(int salSeq,RedirectAttributes rttr) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("store/store/storeModifyPage");
		try {
			SalesBoard salesBoard = storeAdminService.selectSalesBoard(salSeq);
			modelAndView.addObject("salesBoard",salesBoard);
		} catch (SQLException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("errorMsg", "글 로딩에 실패하였습니다.");
			modelAndView.setViewName("redirect:/store/board/"+salSeq);
		}
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView modifyBoardDo(SalesBoard salesBoard,RedirectAttributes rttr) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/store/board/"+salesBoard.getSalesSeq());
		try {
			storeAdminService.updateSalesBoard(salesBoard);
		} catch (SQLException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("errorMsg", "글 수정에 실패하였습니다.");
		}
		return modelAndView;
	}
	
}
