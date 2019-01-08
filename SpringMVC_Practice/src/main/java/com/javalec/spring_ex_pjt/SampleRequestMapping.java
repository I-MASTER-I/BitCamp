package com.javalec.spring_ex_pjt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class SampleRequestMapping {
	
	@RequestMapping("/requestMappingView")
	public String requestMappingView() {
		return "/board/requestMappingView";
	}
}
