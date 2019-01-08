package com.javalec.spring_ex_pjt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	/*
	 * @RequestMapping : 요청을 Mapping하는 Annotation,
	 * /view 경로에 요청시 해당 로직을 수행시키는 역할
	 */ 
	@RequestMapping("/view")
	public String view() {
		return "/view";
	}
	@RequestMapping("/content/contentView")
	public String content(Model model) {
		
		model.addAttribute("id","TestID");
		return "/content/contentView";
	}
	@RequestMapping("/content/contentReply")
	public String reply() {
		return "/content/contentReply";
	}
	
	/*
	 *Model : model 데이터만 있다.
	 *		-> 리턴할때 스트링으로 뷰 이름을 준다.
	 */
	@RequestMapping("model/modelEx")
	public String modelEx(Model model) {
		model.addAttribute("data","Test Data");
		
		//view이름을 주고 반환
		return "model/modelEx";
	}
	
	/*
	 *ModelAndView : 데이터와 뷰를 같이 갖고있다. 
	 *				-> 리턴시 modelAndView타입을 같이 반환
	 */
	@RequestMapping("modelAndView/modelAndView")
	public ModelAndView modelAndView() {
		
		ModelAndView mv = new ModelAndView();
		//속성과 데이터 부여
		mv.addObject("id", "Test ID of ModelAndView");
		//이름 설정
		mv.setViewName("/modelAndView/modelAndView");
		
		return mv;
	}
}
