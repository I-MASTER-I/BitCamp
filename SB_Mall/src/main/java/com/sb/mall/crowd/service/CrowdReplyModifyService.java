package com.sb.mall.crowd.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdReplyDao;
import com.sb.mall.crowd.model.CrowdReply;
import com.sb.mall.store.dao.ReplyDao;
import com.sb.mall.store.model.Reply;

@Component
public class CrowdReplyModifyService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdReplyDao replyDao;
	
	public List<Map<String, Object>> getReplyByreqSeq(int replySeq){
		replyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		
//		List<Map<String, Object>> replyModify= replyDao.getReplyByreqSeq(replySeq);
		
//		return replyModify!=null?replyModify:null;
		return null;
	}
	
	
	public int setReplyUpdate(CrowdReply replyModify) {
		replyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		
		int result = 0;
		
		result= replyDao.setReplyUpdate(replyModify);
		System.out.println("replyModifyResult : "+result);
		
		return result;
	}
	
}
