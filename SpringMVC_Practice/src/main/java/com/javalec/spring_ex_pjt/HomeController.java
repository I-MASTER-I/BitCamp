package com.javalec.spring_ex_pjt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */

/*
 * 4.servlet-context.xml에서 
 * com.javalec.spring_ex_pjt안에 있는 내용 Scan할때 
 * @Controller를 발견하고 Controller로 사용한다.
*/
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * 5. @RequestMapping : 요청을 Mapping하는 Annotation,
	 * value = "/" - /로 들어오면 아래로직 수행후 servlet-context.xml에 View로 페이지를 던진다.(http://localhost/spring_ex_pjt/)
	 * return "home"; 그때 view 페이지 이름을 home으로 정함 
	 */
	
	//(value = "/" :url에서 요청들어오는 요청경로, method = RequestMethod.GET) : 요청경로의 방식 : get방식
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//Format한 System시간을 스트링 타입으로 dateFormat에 담는다.
		String formattedDate = dateFormat.format(date);
		
		//${serverTime}
		model.addAttribute("serverTime", formattedDate );
		
		//view이름 servlet-context.xml에 리턴
		return "home";
	}
	
	@RequestMapping("/board/view")
	public String view() {
		
		return "/board/view";
	}
	
	@RequestMapping("/board/content")
	public String content(Model model) {
		
		model.addAttribute("id",30);
		return "/board/content";
	}
	
	@RequestMapping("/board/reply")
	public ModelAndView reply() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("id",30);
		mv.setViewName("board/reply");
		
		return mv;
	}
	
	@RequestMapping("/index")
	public String goIndex() {
		return "/index";
	}
	

	
	// get방식
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public String goStudent(HttpServletRequest httpServletRequest, Model model) {
		
		System.out.println("RequestMethod.GET");
		
		//HttpServletRequest으로 jsp에서 get방식으로 받은 값을 저장한다.
		String id = httpServletRequest.getParameter("id");
		System.out.println("id" + id);
		model.addAttribute("studentId",id);
		
		return "/student/studentId";
	}
	
	// POST방식
	@RequestMapping(value = "/student", method = RequestMethod.POST)
	public ModelAndView goStudent(HttpServletRequest httpServletRequest) {
		
		System.out.println("RequestMethod.POST");
		
		//HttpServletRequest으로 jsp에서 get방식으로 받은 값을 저장한다.
		String id = httpServletRequest.getParameter("id");
		System.out.println("id" + id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/student/studentId");
		mv.addObject("studentId",id);
		
//		model.addAttribute("student",id);
//		return "/student/studentId";
		
		return mv;
	}
	
	@RequestMapping("/index2")
	public String goIndex2() {
		return "/index2";
	}
	
	@RequestMapping("/studentView")
	public String studentView(@ModelAttribute("studentInfo") StudentInfomation studentInfomation) {
		return "/studentView";
	}
}
