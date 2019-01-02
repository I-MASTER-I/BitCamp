/*package 예시;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class 컨트롤러예시 {
	
	@Autowired
	Service service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView admin() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("");
		modelAndView.addObject("", "");
		
		return modelAndView;
	}

}

*/