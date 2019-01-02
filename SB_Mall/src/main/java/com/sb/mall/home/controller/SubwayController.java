package com.sb.mall.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubwayController {
	
	@RequestMapping("subway")
	public String subwayPage() {
		return "view/community/contents/subway"; 
	}
	
}
