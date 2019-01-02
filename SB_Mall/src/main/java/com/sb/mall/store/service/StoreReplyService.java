package com.sb.mall.store.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.store.dao.ReplyDao;
import com.sb.mall.store.model.Reply;

@Component
public class StoreReplyService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private ReplyDao replyDao;
	
	public List<Map<String, Object>> getReplys(int salesSeq, int nowPage){
		System.out.println("reply service in");
		
		List<Map<String, Object>> replyList = new ArrayList<Map<String, Object>>();
		
		replyDao = sqlSessionTemplate.getMapper(ReplyDao.class);
		
		int firstRow = (nowPage-1)*10;
		System.out.println("salesSeq : "+salesSeq+" , firstRow : "+firstRow);
		System.out.println("getReply before");
		replyList = replyDao.getReply(salesSeq,firstRow);
		System.out.println("getReply after");
		
		return replyList!=null?replyList:null;
	}
	
	
	public int getReplyCount(int salesSeq) {
		replyDao = sqlSessionTemplate.getMapper(ReplyDao.class);
		int reCnt;
		int pageCnt=0;
		
		reCnt = replyDao.getReplyCount(salesSeq);
		System.out.println("reCnt : " + reCnt);
		pageCnt = (reCnt/10);
		
		if(reCnt%10>0) {
			pageCnt+=1;
		}
		System.out.println("pageCnt : "+pageCnt);
		
		return pageCnt;
	}
	
	
	
	public boolean writeReplyService(Reply replyWrite) {
		replyDao = sqlSessionTemplate.getMapper(ReplyDao.class);
		boolean result = false;
		int writeDone;
		
		writeDone = replyDao.writeReply(replyWrite);
		System.out.println("writeDone : "+writeDone);
		
		if(writeDone==1) {
			result=true;
		}
		
		return result;
	}
	
	
	public boolean deleteReplyService(int replySeq) {
		replyDao = sqlSessionTemplate.getMapper(ReplyDao.class);
		boolean result = false;
		int deleteDone=0;
		
		System.out.println("delete Before");
		deleteDone = replyDao.deleteReply(replySeq);
		System.out.println("delete after");
		if(deleteDone==1) {
			result=true;
		}
		System.out.println("삭제여부 : "+result);
		
		return result;
	}
	
	
	
	
	
}
