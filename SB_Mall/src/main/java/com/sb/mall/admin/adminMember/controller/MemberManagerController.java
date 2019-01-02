package com.sb.mall.admin.adminMember.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminMember.service.AdminMemberService;
import com.sb.mall.home.model.PageListView;

@Controller
public class MemberManagerController {
	
	static final int COUNT_PER_PAGE = 10;
	
	@Autowired
	AdminMemberService service;
	
	//loadMemberList ajax
		@RequestMapping(value = "/admin/adminMember/memberManager/loadMemberList", method = RequestMethod.GET)
		public ModelAndView loadReturnList(@RequestParam(value = "startDate", required = true) String startDate,
				@RequestParam(value = "endDate", required = true) String endDate,
				@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
				@RequestParam(value = "gradeNum", defaultValue = "-1") int gradeNum,
				@RequestParam(value = "search", defaultValue = "") String search) {

			ModelAndView modelAndView = new ModelAndView();

			// loadReturnList.jsp 에 넣을 객체를 받아온다.
			PageListView viewData = service.getMemberVOList(startDate, endDate, pageNumber, COUNT_PER_PAGE, gradeNum, search);

			modelAndView.addObject("viewData", viewData);

			modelAndView.setViewName("admin/adminMember/memberManager/loadMemberList");

			return modelAndView;
		}
		
		//회원등급 업데이트 loadMemberList ajax
		@RequestMapping(value = "/admin/adminMember/memberManager/loadMemberList/changeGradeNum/{gradeNum}", method = RequestMethod.POST)
		@ResponseBody
		public String changeRefund(@RequestBody List<Object> memberArray, 
				@PathVariable int gradeNum) {
			
			//주문 상태 업데이트
			service.changeGradeNum(memberArray, gradeNum);
			
			return "변경 완료!";
		}
		
		//회원 삭제 loadMemberList ajax
		@RequestMapping(value = "/admin/adminMember/memberManager/loadMemberList/memberDelete", method = RequestMethod.POST)
		@ResponseBody
		public String memberDelete(@RequestBody List<Object> memberArray) {
			
			//주문 상태 업데이트
			service.memberDelete(memberArray);
			
			return "탈퇴 완료!";
		}
		

}

