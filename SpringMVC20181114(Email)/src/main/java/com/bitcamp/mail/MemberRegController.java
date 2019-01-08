package com.bitcamp.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberRegController {
	
	//의존설정 : 회원가입 서비스 
	//Mail 발솔을 위한 의존설정(MailSender 필요)
//	private MailSender sender;
	
	@Autowired
	private SimpleRegistrationNotifier noti;//현재 null이기 때문에 주입을 받아야한다.
	
	@RequestMapping("memberReg")
	public String memberReg() {
		
		System.out.println("MemberRegController");
		//회원가입 서비스.가입()
		//가입 메일 발송
		noti.sendMail("catas43@naver.com");
		
		/*html형식으로 메일 보내기*/
		noti.mailSendHtml("catas43@naver.com");
		
		return "/memberReg";
	}
	
	
	

}
