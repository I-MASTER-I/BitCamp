package com.sb.mall.crowd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.crowd.service.CrowdReplyService;
import com.sb.mall.store.service.StoreReplyService;

@Controller
public class CrowdReplyDeleteController {
	
	@Autowired
	private CrowdReplyService replyService;
	
	@ResponseBody
	@RequestMapping("crowd/replyDelete")
	public String replyDelete(@RequestParam("crReplySeq")int replySeqDel) {
		String result = "댓글 삭제 실패.";
		System.out.println("deleteController IN");
		
		if(replyService.deleteReplyService(replySeqDel)) {
			result="댓글 삭제 성공.";
		}
		
		return result;
	}
}
