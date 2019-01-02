package com.sb.mall.admin.adminOperation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.model.TotalReportVO;
import com.sb.mall.admin.adminOperation.service.AdminOperationService;

@Controller
public class TotalReportController {

	@Autowired
	AdminOperationService operationService;

	// 영업 현황 loadBottomReport ajax
	@RequestMapping(value = "/admin/adminOperation/totalReport/loadBottomReport", method = RequestMethod.GET)
	public ModelAndView loadBottomReport(@RequestParam(value="nowDate", required=false) String nowDate) {

		ModelAndView modelAndView = new ModelAndView();
		
		//loadBottomReport에 넣을 객체를 받아온다. 
		TotalReportVO totalReportVO = new TotalReportVO();
		
		totalReportVO = operationService.getTotalReportVO(nowDate);
		
		modelAndView.addObject("totalReportVO", totalReportVO);
		
		modelAndView.setViewName("admin/adminOperation/totalReport/loadBottomReport");

		return modelAndView;
	}
	
	// excelBottomReport 엑셀로 다운.
	@RequestMapping(value = "/admin/adminOperation/totalReport/excelBottomReport", method = RequestMethod.GET)
	public ModelAndView excelBottomReport(@RequestParam(value="nowDate", required=false) String nowDate) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		//excelBottomReport에 넣을 객체를 받아온다. 
		TotalReportVO totalReportVO = new TotalReportVO();
		
		totalReportVO = operationService.getTotalReportVO(nowDate);
		
		modelAndView.addObject("totalReportVO", totalReportVO);
		
		modelAndView.setViewName("admin/adminOperation/totalReport/excelBottomReport");
		
		return modelAndView;
	}

}
