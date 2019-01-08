package com.bitcamp.web1115;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/encript")
public class EncriptController {
	
	@Autowired
	private Sha256 sha256;
	
	@Autowired
	private AES256Util aES256Util;
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
		return "form";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String result(
			@RequestParam("id") String id, 
			@RequestParam String pw,
			Model model
			) throws Exception {
		
		String eId = sha256.encrypt(id); //암호화된 아이디 eId
		System.out.println("암호화된 ID :"+eId);
		String ePw = sha256.encrypt(pw); //암호화된 아이디 eId
		System.out.println("암호화된 PW :"+ePw);
		
		model.addAttribute("id", eId);
		model.addAttribute("pw", ePw);
		
		String newID = aES256Util.encrypt(id);
		System.out.println("암호화 ID : "+newID);
		String newPW = aES256Util.encrypt(pw);
		System.out.println("암호화 ID : "+newPW);
		
		model.addAttribute("dID", aES256Util.decrypt(newID));
		model.addAttribute("dPW", aES256Util.decrypt(newPW));
		
		return "result";
	}
	
}
