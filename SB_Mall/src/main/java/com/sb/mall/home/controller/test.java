package com.sb.mall.home.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class test {

	@RequestMapping(value="/chart", method = RequestMethod.GET)
	public ModelAndView adminPage() throws JsonProcessingException {

		ModelAndView modelAndView = new ModelAndView("/admin/etc/bar");

		List<testObject> list = new ArrayList<testObject>();

		list.add(new testObject("q1", 100, 150));
		list.add(new testObject("q2", 250, 190));
		list.add(new testObject("q3", 180, 200));
		list.add(new testObject("q4", 310, 190));

		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString( list );
		modelAndView.addObject("ba", jsonText);

		return modelAndView;
	}
	
	@RequestMapping(value="/chart2", method = RequestMethod.GET)
	public ModelAndView adminPage2() throws JsonProcessingException {
		
		ModelAndView modelAndView = new ModelAndView("/admin/etc/bar2");
		
		List<testObject> list = new ArrayList<testObject>();
		
		list.add(new testObject("q1", 100, 150));
		list.add(new testObject("q2", 250, 190));
		list.add(new testObject("q3", 180, 200));
		list.add(new testObject("q4", 310, 190));
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString( list );
		modelAndView.addObject("ba", jsonText);
		
		return modelAndView;
	}

}
