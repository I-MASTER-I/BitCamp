package com.sb.mall.admin.adminStatistics.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.admin.adminStatistics.model.MemberStatVO;
import com.sb.mall.admin.adminStatistics.model.MemberTotalVO;
import com.sb.mall.admin.adminStatistics.model.VisitStatVO;
import com.sb.mall.admin.adminStatistics.service.AdminStatisticsService;

@Controller
public class MemberStatController {
	
	@Autowired
	AdminStatisticsService service;

	// 방문 통계 컨트롤러
	@RequestMapping(value = "/admin/adminStatistics/memberStat/loadMemberStatReport", method = RequestMethod.GET)
	public ModelAndView loadMemberStatReport(@RequestParam String nowDate) {

		ModelAndView modelAndView = new ModelAndView();
		
		MemberStatVO memberStatVO = new MemberStatVO();
		
		//nowDate의 방문수 결과를 반환한다.
		memberStatVO = service.memberStatVO(nowDate);
		
//		현재 날짜 및 시간
		LocalDateTime localDate = LocalDateTime.now();
//		현재 날짜를 스트링 형식으로 저장
		String date =  localDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
//		현재 시간과 분과 초를 스트링 형식으로 저장
		String nowTimeSec = localDate.format(DateTimeFormatter.ofPattern("hh:mm:ss"));
//		현재 시간과 분을 스트링 형식으로 저장
		String nowTime = localDate.format(DateTimeFormatter.ofPattern("hh:mm"));
//		현재 시간을 스트링 형식으로 저장
		String nowHour = localDate.format(DateTimeFormatter.ofPattern("hh"));
//		현재 분을 스트링 형식으로 저장
		String nowMinute = localDate.format(DateTimeFormatter.ofPattern("mm"));
//		nowDate가 오늘인지 확인하는 변수
		boolean today = false;

//		오늘일 경우 today를 true로 바꿔준다.
		if (nowDate.equals(date)) 
			today = true;

		
		modelAndView.addObject("memberStatVO", memberStatVO);

		modelAndView.addObject("today", today);
		
		modelAndView.addObject("nowTimeSec", nowTimeSec);
		
		modelAndView.addObject("newDate", nowDate);

		modelAndView.setViewName("admin/adminStatistics/memberStat/loadMemberStatReport");

		return modelAndView;
	}
	
	//총 가입자 현황
	@RequestMapping(value = "/admin/adminStatistics/memberStat/loadMemberStatReport/memberTotal", method = RequestMethod.GET)
	@ResponseBody
	public String memberTotal(@RequestParam String nowDate) throws JsonProcessingException {
		
		MemberTotalVO memberTotalVO = new MemberTotalVO();
		
		//total 회원 통계를 불러온다.
		memberTotalVO = service.memberTotal(nowDate);
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String memberTotal = mapper.writeValueAsString(memberTotalVO);
		
		return memberTotal;
	}
	
	// 최근 15일 가입 차트
	@RequestMapping(value = "/admin/adminStatistics/memberStat/loadMemberStatReport/fifthJoin", method = RequestMethod.GET)
	@ResponseBody
	public String fifthJoin(@RequestParam String nowDate) throws JsonProcessingException {
		
		List<Map<String, Object>> fifthJoinList = new ArrayList<Map<String,Object>>();
		
		fifthJoinList = service.fifthJoin(nowDate);
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String fifthJoin = mapper.writeValueAsString(fifthJoinList);
		
		return fifthJoin;
	}
	
	//월별 가입 차트
	@RequestMapping(value = "/admin/adminStatistics/memberStat/loadMemberStatReport/monthlyJoin", method = RequestMethod.GET)
	@ResponseBody
	public String monthlyChart(@RequestParam String nowDate) throws JsonProcessingException {
		
		List<Map<String, Object>> monthlyJoinList = new ArrayList<Map<String,Object>>();
		
		monthlyJoinList = service.monthlyJoin(nowDate);
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String monthlyJoin = mapper.writeValueAsString(monthlyJoinList);
		
		return monthlyJoin;
	}

}
