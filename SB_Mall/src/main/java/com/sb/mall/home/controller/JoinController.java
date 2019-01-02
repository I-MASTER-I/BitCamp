package com.sb.mall.home.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.AES256Util;
import com.sb.mall.member.service.MemberJoinService;
import com.sb.mall.member.service.MemberMailService;
import com.sb.mall.member.service.Sha256;

@Controller 

//joinSession추가
@RequestMapping("member/join") // 요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
@SessionAttributes("memberInfo")
public class JoinController {
	
	/*1.회원가입 관련 의존주입(insert)*/
	@Autowired
	private MemberJoinService joinService;
	
	/*2.메일 송신 관련 의존주입*/
	@Autowired
	private MemberMailService noti;
	
	/*3.암호화 관련 의존주입 2018.11.16*/
	@Autowired
	private Sha256 sha256;
	
	/*4.암호화 관련 의존주입 2018.11.16*/
	@Autowired
	private AES256Util aES256Util;
	
	/*[1] Join 첫 화면 불러오는 Method*/
	@RequestMapping(method = RequestMethod.GET) 
	public String getJoinForm() {
		/*Check Message*/
		//System.out.println("<<**JoinController**>>");
		//System.out.println("/*[1] Join 첫 화면 불러오는 Method*/");
		
		return "view/joinForm";
	}
	
	/*[3]주소API POPUP화면 Method*/
	@RequestMapping("/popup/jusoPopup")
	public String addressAIP() {
		/*Check Message*/
		//System.out.println("<<**JoinController**>>");
		//System.out.println("/*[3]주소API POPUP화면 Method*/");
		return "/popup/jusoPopup";
	}

	
	/*[5]아이디 중복검사 Method 2018.11.19*/
	@RequestMapping("/id_DuplicateCheck")
	@ResponseBody
	public int idDuplicate(String userId, HttpServletRequest request) {
		/*Check Message*/
		//System.out.println("<<**JoinController**>>");
		//System.out.println("/*[4]아이디 중복검사 Method 2018.11.19*/");
		//System.out.println("중복검사 할 아이디 : ["+userId+"]");
		
		int id_Check = 0;
		try {
			id_Check = joinService.idCheckResult(userId, request);
		} catch (IllegalStateException | SQLException | IOException e) {
			e.printStackTrace();
		}
		
		return id_Check;
	}
	
	
	/*[2] 회원가입시 DB에 회원정보 저장하는 Method*/
	@RequestMapping(method = RequestMethod.POST)  
	public ModelAndView getResultForm(
			MemberInfo memberInfo, 
			HttpServletRequest request, 
			HttpSession session
			) {
		
		
		/*Check Message*/
		//System.out.println("<<**JoinController**>>");
		//System.out.println("/*[2] 회원가입시 DB에 회원정보 저장하는 Method*/");
		//System.out.println("The Name is inputed this site : " + memberInfo.getUserName());
		//System.out.println(memberInfo.getGender());
		
		//모델 뷰 생성
		ModelAndView modelAndView = new ModelAndView();
		
		//리턴할 경로 저장
		modelAndView.setViewName("/home");
		
		/*2018.11.15 메일 보내기용 userid(가입시 입력된 Email)*/
		String userId = memberInfo.getUserId();
		String userName = memberInfo.getUserName();
		String filePath = "/member/memberWelcome.jsp";
		
		/*//비밀번호 재 확인
		if (!memberInfo.getUserPw().equals(userPwChck)) {
			modelAndView.setViewName("error/joinError");
			modelAndView.addObject("error","The password is different");
			return modelAndView;
		}*/
		
		/*2018.11.16 암호화 패치*/ 
		try {
			
			/*Check Message*/
			//System.out.println("/*[5] AES256Util 2018.11.16 암호화 패치*/");
			//System.out.println("The Password you inputed :" + memberInfo.getUserPw());
			String encryptionPW = null;
			encryptionPW = aES256Util.encrypt(memberInfo.getUserPw());
			//System.out.println("be encryption password :" + encryptionPW);
			memberInfo.setUserPw(encryptionPW);
			//System.out.println("암호화 처리 완료");
			
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (GeneralSecurityException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		/*Check Message*/
		//System.out.println("<회원정보>");
		//System.out.println(memberInfo.toString());
		
		//System.out.println("Session time Setting");
		session.setMaxInactiveInterval(7200); 
		//System.out.println("Session time Setting End");
		
		
		try {
			
			//joinSession에 memberInfo등록
			int resultCnt = joinService.joinResult(memberInfo, request);
			modelAndView.addObject("memberInfo", memberInfo);
			
			//1. Session(memberInfo) is not null 일때 회원가입
			if (memberInfo != null) {
				
				/*Check Message*/
				//System.out.println("[2].1. Session is not null");
				//System.out.println("<Controller Message>");
				//System.out.println("가입한 회원 ID:" + memberInfo.getUserId());
				//1.1 회원가입 실패시 : resultCnt == 0 
				if(resultCnt==0) {
					
					/*Check Message*/
					//System.out.println("[2].1.1 회원가입 실패");
					
					modelAndView.setViewName("error/joinError");
				
				}else {
					
					/*Check Message*/
					//System.out.println("[2].1.2 회원가입 성공");
					//System.out.println("[Start of send Email]");
					noti.sendMail(userId, userName, filePath ,session);
					//System.out.println("[End of send Email]");
					
					//System.out.println("End of Method(회원가입 Method)");
					
					modelAndView.setViewName("view/home");
				}
				
			}else {
				System.out.println("2.ID has already been taken.");
				modelAndView.setViewName("view/home");
			}
			
		} catch (SQLException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("SQLExceptione");
		} catch (IllegalStateException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("IllegalStateException");
		} catch (IOException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("IOException");
		}catch (Exception e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("Exception");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
		}
		
		return modelAndView;
		
	}// end of method (getResultForm)
}// end of class (JoinController)

