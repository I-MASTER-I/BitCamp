package com.sb.mall.crowd.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdReplyDao;
import com.sb.mall.crowd.model.CrowdReply;

@Component
public class CrowdReplyService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdReplyDao crowdReplyDao;
	
	public List<Map<String, Object>> getReplys(int salesSeq, int nowPage){
		System.out.println("reply service in");
		
		List<Map<String, Object>> replyList = new ArrayList<Map<String, Object>>();
		
		crowdReplyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		
		int firstRow = (nowPage-1)*10;
		replyList = crowdReplyDao.getReply(salesSeq,firstRow);
		
		return replyList!=null?replyList:null;
	}
	
	public int getReplyCount(int salesSeq) {
		crowdReplyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		int reCnt;
		int pageCnt=0;
		
		reCnt = crowdReplyDao.getReplyCount(salesSeq);
		pageCnt = (reCnt/10);
		
		if(reCnt%10>0) {
			pageCnt+=1;
		}
		
		return pageCnt;
	}
	
	
	
	public boolean writeReplyService(CrowdReply replyWrite) {
		crowdReplyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		boolean result = false;
		int writeDone;
		
		writeDone = crowdReplyDao.writeReply(replyWrite);
		
		if(writeDone==1) {
			result=true;
		}
		
		return result;
	}
	
	
	public boolean deleteReplyService(int replySeq) {
		crowdReplyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		boolean result = false;
		int deleteDone=0;
		
		deleteDone = crowdReplyDao.deleteReply(replySeq);
		if(deleteDone==1) {
			result=true;
		}
		System.out.println("삭제여부 : "+result);
		
		return result;
	}
}
