package com.sb.mall.admin.adminOperation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.model.BudgetVO;
import com.sb.mall.admin.adminOperation.service.AdminOperationService;

@Controller
public class BudgetController {
	
	@Autowired
	AdminOperationService operationService;

	// 버젯 조회 loadBudgetReport ajax
	@RequestMapping(value = "/admin/adminOperation/budget/loadBudgetReport", method = RequestMethod.GET)
	public ModelAndView loadBottomReport(@RequestParam(value="nowYear", required=false) String nowYear) {

		ModelAndView modelAndView = new ModelAndView();
		
		//loadBudgetReport에 넣을 객체를 받아온다. 
		BudgetVO budgetVO = new BudgetVO();
		try {
			budgetVO = operationService.getBudgetVO(nowYear);
		} catch (Exception e) {
			operationService.insertBudget(nowYear);
			budgetVO = operationService.getBudgetVO(nowYear);
		}
		
		
		modelAndView.addObject("budgetVO", budgetVO);
		
		modelAndView.setViewName("admin/adminOperation/budget/loadBudgetReport");

		return modelAndView;
	}
	
	//버젯 입력 loadBudgetReport ajax
	@ResponseBody
	@RequestMapping(value = "/admin/adminOperation/budget/loadBudgetReport/updateBudget", method = RequestMethod.POST)
	public String updateBudget(BudgetVO budgetVO) {
		
		operationService.updateBudget(budgetVO);
		
		return "수정 완료!";
	}
	

}
