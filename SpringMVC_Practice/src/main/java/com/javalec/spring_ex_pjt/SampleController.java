package com.javalec.spring_ex_pjt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
	
	/*
	 * @RequestMapping : 요청을 Mapping하는 Annotation,
	 * /view 경로에 요청시 해당 로직을 수행시키는 역할
	 */ 
	@RequestMapping("/popup")
	public String sample() {
		System.out.println("Sample실행");
		return "/popup/Sample";
	}
	@RequestMapping("/popup/jusoPopup")
	public String sample2() {
		System.out.println("실행");
		
		return "/popup/jusoPopup";
	}
	
}
