package com.sb.mall.admin.adminStatistics.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.admin.adminStatistics.model.VisitStatVO;
import com.sb.mall.admin.adminStatistics.service.AdminStatisticsService;

@Controller
public class VisitStatController {
	
	@Autowired
	AdminStatisticsService service;

	// 방문 통계 컨트롤러
	@RequestMapping(value = "/admin/adminStatistics/visitStat/loadVisitStatReport", method = RequestMethod.GET)
	public ModelAndView loadVisitStatReport(@RequestParam String nowDate) {

		ModelAndView modelAndView = new ModelAndView();
		
		VisitStatVO visitStatVO = new VisitStatVO();
		
		//nowDate의 방문수 결과를 반환한다.
		visitStatVO = service.getVisitStatVO(nowDate);
		
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

		
		modelAndView.addObject("visitStatVO", visitStatVO);

		modelAndView.addObject("today", today);
		
		modelAndView.addObject("nowTimeSec", nowTimeSec);
		
		modelAndView.addObject("newDate", nowDate);

		modelAndView.setViewName("admin/adminStatistics/visitStat/loadVisitStatReport");

		return modelAndView;
	}
	
	// 최근 15일 방문 통계 차트
	@RequestMapping(value = "/admin/adminStatistics/visitStat/loadVisitStatReport/fifthChart", method = RequestMethod.GET)
	@ResponseBody
	public String fifthChart(@RequestParam String nowDate) throws JsonProcessingException {
		
		List<Map<String, Object>> fifthChart = new ArrayList<Map<String,Object>>();
		
		fifthChart = service.fifthChart(nowDate);
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String fifthVisit = mapper.writeValueAsString(fifthChart);
		
		return fifthVisit;
	}
	
	// 시간대별 방문 통계 차트
	@RequestMapping(value = "/admin/adminStatistics/visitStat/loadVisitStatReport/hourlyChart", method = RequestMethod.GET)
	@ResponseBody
	public String hourlyChart(@RequestParam String nowDate) throws JsonProcessingException {
		
		List<Map<String, Object>> hourlyChart = new ArrayList<Map<String,Object>>();
		
		hourlyChart = service.hourlyChart(nowDate);
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String hourlyVisit = mapper.writeValueAsString(hourlyChart);
		
		return hourlyVisit;
	}
	
	// 시간대별 방문 통계 차트
	@RequestMapping(value = "/admin/adminStatistics/visitStat/loadVisitStatReport/monthlyChart", method = RequestMethod.GET)
	@ResponseBody
	public String monthlyChart(@RequestParam String nowDate) throws JsonProcessingException {
		
		List<Map<String, Object>> monthlyChart = new ArrayList<Map<String,Object>>();
		
		monthlyChart = service.monthlyChart(nowDate);
		
		//JSON으로 변환하는 메서드 
		ObjectMapper mapper = new ObjectMapper();
		String monthlyVisit = mapper.writeValueAsString(monthlyChart);
		
		return monthlyVisit;
	}

}
