package com.sb.mall.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.MemberModifyService;

@Controller
public class MemberModifyController {

	@Autowired
	private MemberModifyService memberModifyService;

	@RequestMapping(value = "/member/memberModifyCheck", method = RequestMethod.POST)
	public ModelAndView getMember(String id,String pw) {
		ModelAndView modelAndView = new ModelAndView("member/memberModify");
		// 내 정보 가져오기
		MemberInfo member= new MemberInfo();
		try {
			member = memberModifyService.getMember(id,pw);
		} catch (Exception e) {
			modelAndView.addObject("pwCheck", "fail");
			e.getMessage();
		}
		// View에 로그인한 現 회원정보 담아서 리턴
		modelAndView.addObject("member", member);
		return modelAndView;
	}

	@RequestMapping(value = "/member/memberModify", method = RequestMethod.POST)
	@ResponseBody
	public String getMemberModify_end(MemberInfo memberInfo) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String result = memberModifyService.modifyMember(memberInfo);
		return result;
	}

}
