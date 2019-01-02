package com.sb.mall.admin.adminMain.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.admin.adminMain.model.AdminMainVO;
import com.sb.mall.admin.adminMain.service.AdminMainService;
import com.sb.mall.admin.adminMain.service.AdminPagingService;
import com.sb.mall.home.model.PageListView;


@Controller
public class AdminMainController {
	
	@Autowired
	private AdminMainService adminService;
	@Autowired
	private AdminPagingService service;
	
	static final int COUNT_PER_PAGE = 10;
	
	//관리자페이지 메인
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView adminMain(@RequestParam(value="page", defaultValue="1") int membPageNum) throws JsonProcessingException {
		
		ModelAndView modelAndView = new ModelAndView("/admin/adminMain");
		
		//메인 어드민 총 정보
		AdminMainVO admin = new AdminMainVO();
		
		//상품 Top5 저장할 맵(상품 이름, 상품 매출)
		Map<String, Object> top5Map = new HashMap<String, Object>();
		//이번년도 월별 매출 리스트
		List<Map<String, Object>> salesMonthThisYearAverage = new ArrayList<Map<String,Object>>();
		
		//모든 어드민 정보 가져오기
		admin = adminService.getAdminReport();
		
		//리스트에서 상품 리스트 맵을 읽어서 그것을 각각 key 값만 맵에 저장(상품 이름, 상품 매출)
		admin.getProductTop5().forEach((goodsItem) -> {
			top5Map.put((String)goodsItem.get("goodsName"), goodsItem.get("salePrice"));
		});
		//월별 매출 및 평균 리스트 값 할당
		salesMonthThisYearAverage=admin.getSalesMonthThisYearAverage();
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String top5MapJson = mapper.writeValueAsString( top5Map );
		String salesJson = mapper.writeValueAsString(salesMonthThisYearAverage);
		String orderStatus = mapper.writeValueAsString(admin.getOrderStatus());
		String budgetSales = mapper.writeValueAsString(admin.getBudgetSales());
		
		modelAndView.addObject("dataTop5", top5MapJson);
		modelAndView.addObject("salesYear", salesJson);
		modelAndView.addObject("orderStatus", orderStatus);
		modelAndView.addObject("budgetSales", budgetSales);
		modelAndView.addObject("admin", admin);
		//해당 페이지 버튼 활성화
		modelAndView.addObject("adminMain", "active");
		
		
		
		return modelAndView;
	}
	
	//관리자 메인 회원리스트
	@RequestMapping("/admin/adminMemberList")
	public ModelAndView getMemberList(@RequestParam(value="page", defaultValue="1") int pageNumber)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();

			modelAndView.setViewName("admin/option/adminMemberList");
			
			PageListView listView = service.getList(pageNumber, COUNT_PER_PAGE, "memberDao");


			modelAndView.addObject("viewData", listView);

		return modelAndView;
	}
	
	//관리자 메인 주문리스트
	@RequestMapping("/admin/adminOrderList")
	public ModelAndView getDetailList(@RequestParam(value="page", defaultValue="1") int pageNumber)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();

			modelAndView.setViewName("admin/option/adminOrderList");
			
			PageListView listView = service.getList(pageNumber, COUNT_PER_PAGE, "orderDetailDao");


			modelAndView.addObject("viewData", listView);

		return modelAndView;
	}
	
	
}
