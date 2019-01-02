package com.sb.mall.crowd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.crowd.model.CrowdReply;
import com.sb.mall.crowd.service.CrowdReplyService;
import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.store.model.Reply;
import com.sb.mall.store.service.StoreReplyService;

@Controller
public class CrowdReplyWriteController {
	
	@Autowired
	private CrowdReplyService replyService;
	
	@ResponseBody
	@RequestMapping("crowd/replyWrite")
	public String writeReply(HttpServletRequest request, HttpSession session, CrowdReply replyWrite) {
		MemberInfo LoginMember = (MemberInfo) session.getAttribute("memberInfo");
		replyWrite.setUserSeq(LoginMember.getUserSeq());
		
		String result = "댓글 등록 실패.";
		
		boolean writeReplyOk = replyService.writeReplyService(replyWrite);
		
		if(writeReplyOk) {
			result="댓글 등록 성공.";
		}
		
		System.out.println(result);
		return result;
	}

}
