package com.sb.mall.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

		
	@Controller
	public class Weathercontroller {

		@RequestMapping("weather")
		public String weatherPage() {
//			System.out.println("날씨");
			return "view/community/contents/weather";
		}

	}


