package com.sb.mall.admin.adminOperation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.model.SalVO;
import com.sb.mall.admin.adminOperation.service.AdminOperationService;
import com.sb.mall.home.model.PageListView;

@Controller
public class HourlySalController {

	static final int COUNT_PER_PAGE = 12;

	@Autowired
	AdminOperationService operationService;

	// 일별 주문현황 loadhourlySalReport ajax
	@RequestMapping(value = "/admin/adminOperation/hourlySal/loadHourlySalReport", method = RequestMethod.GET)
	public ModelAndView loadHourlySalReport(@RequestParam(value = "startDate", required = true) String startDate,
			@RequestParam(value = "endDate", required = true) String endDate,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber) {

		ModelAndView modelAndView = new ModelAndView();

		// dailySal.jsp 에 넣을 객체를 받아온다.
		PageListView viewData = operationService.getHourlySalVOList(startDate, endDate, tableName, pageNumber,
				COUNT_PER_PAGE);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("admin/adminOperation/hourlySal/loadHourlySalReport");

		return modelAndView;
	}
	
	// 엑셀 저장 
		@RequestMapping(value = "/admin/adminOperation/hourlySal/excelHourlySalReport", method = RequestMethod.GET)
		public ModelAndView excelHourlySalReport(@RequestParam(value = "startDate", required = true) String startDate,
				@RequestParam(value = "endDate", required = true) String endDate,
				@RequestParam(value = "tableName", required = true) String tableName,
				@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
				@RequestParam(value = "totalAmount", required = false) long totalAmount) {

			ModelAndView modelAndView = new ModelAndView();

			// excelhourlySalReport.jsp 에 넣을 객체를 받아온다.
			PageListView viewData = operationService.getHourlySalVOList(startDate, endDate, tableName, pageNumber,
					COUNT_PER_PAGE);

			modelAndView.addObject("startDate", startDate);
			modelAndView.addObject("viewData", viewData);
			modelAndView.addObject("totalAmount", totalAmount);
			modelAndView.setViewName("admin/adminOperation/hourlySal/excelHourlySalReport");

			return modelAndView;
		}
	

}
