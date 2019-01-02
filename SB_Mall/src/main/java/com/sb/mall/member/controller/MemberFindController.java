package com.sb.mall.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.AES256Util;
import com.sb.mall.member.service.MemberFindService;
import com.sb.mall.member.service.MemberLoginMailService;
import com.sb.mall.member.service.MemberModifyService;
import com.sb.mall.member.service.MemberMypageService;

@Controller
public class MemberFindController {

	@Autowired
	private MemberFindService findService;

	@Autowired
	private MemberLoginMailService noti2;

	@Autowired
	private MemberMypageService memberInfoService;

	@Autowired
	private MemberModifyService memberUpdateSerivce;
	@Autowired
	private AES256Util aes256;

	// find_id 으로 요청이들어오면 "/member/find_id_form".jsp 파일을 응답해주는 내용
	// 아이디 찾기 버튼 클릭시 아이디 찾기 폼으로 이동
	@RequestMapping(value = "/member/find/find_id", method = RequestMethod.GET)
	public String find_id_form() throws Exception {
		return "login/find_id_form";
	}

	// 아이디 찾기
	@RequestMapping(value = "/member/find/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("userName") String userName,
			@RequestParam("phone") String phone, Model md) throws Exception {
		md.addAttribute("id", findService.findId(response, userName, phone));
		return "login/find_id";
	}

	@RequestMapping(value = "/member/find/find_pw", method = RequestMethod.GET)
	public String find_pw_form() throws Exception {
		return "login/find_pw_form";
	}

	@RequestMapping(value = "/member/find/find_pw", method = RequestMethod.POST)
	public String find_pw(HttpServletResponse response, @RequestParam("userId") String userId,
			@RequestParam("userName") String userName, Model md) throws Exception {
		MemberInfo memberInfo = new MemberInfo();
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		// userId로 데이터베이스를 조회해서 memberInfo 가져오기
		memberInfo = memberInfoService.getMemberInfo(userId);
		// 난수로 변경된 비밀번호를 암호화해서 저장
		String encryptionPW = aes256.encrypt(pw);
		// 난수로 변경된 비밀번호를 저장
		memberInfo.setUserPw(encryptionPW);
		// 업데이트문
		memberUpdateSerivce.modifyMemberPw(memberInfo);
		// 메일보내기
		noti2.mailSendHtml(userId, pw);
		return "login/find_pw";
	}
}
