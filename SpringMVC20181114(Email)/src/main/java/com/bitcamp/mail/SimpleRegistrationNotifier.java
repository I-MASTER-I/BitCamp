package com.bitcamp.mail;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

//import com.bitcamp.memberboard.member.model.Member;

public class SimpleRegistrationNotifier {
	@Autowired
//	private MailSender mailSender;//실질적으로 메일을 보내주는 역할
	private JavaMailSender mailSender;//HTML형식으로 메일을 보내주기 위해 JavaMailSender로 선언

	/*
	 * public void sendMail(Member member) { SimpleMailMessage message = new
	 * SimpleMailMessage(); message.setSubject("[Simple] 회원 가입을 축하합니다.");
	 * message.setFrom("isincorp@gmail.com");//보내는사람 메일
	 * message.setText("회원 가입을 환영합니다."); message.setTo(member.getMemberid()); try {
	 * mailSender.send(message); } catch (MailException ex) { ex.printStackTrace();
	 * } }
	 */

	/*Mail 보내기*/
	public void sendMail(String memberemail) {

		// Context of mail(Mailaddress)
		System.out.println("Sending Email...<sendMail>");
		System.out.println("수신자 : "+memberemail);
		
		SimpleMailMessage message = new SimpleMailMessage();

		message.setSubject("[Simple] 회원 가입 안내");
		message.setFrom("isincorp@gmail.com");
		message.setText("회원 가입을 환영합니다.");
		message.setTo(memberemail);

		try {

			// mailSender가 메일 발송처리
			mailSender.send(message);

		} catch (MailException ex) {

			ex.printStackTrace();
		}
		System.out.println("end");

	}

	/*HTML형식 Mail 보내기*/
	public void mailSendHtml(String email) {

		System.out.println("Sending Email...<mailSendHtml>");
		System.out.println("수신자 : "+email);
		MimeMessage message = mailSender.createMimeMessage();

		try {
			message.setSubject("[안내] 회원가입을 축하합니다.", "utf-8");
			String htmlStr = "<B>Hello</B> Sir <br> " + "Thanks for join in this site <br>"
					+ "<a href=\"http://www.naver.com\">to go Site</a>";

			message.setText(htmlStr, "utf-8", "html");

			message.addRecipient(RecipientType.TO, new InternetAddress(email));
			
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("end");
	}

}
