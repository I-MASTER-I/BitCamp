package com.sb.mall.QnA.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.QnA.dao.QnADao;
import com.sb.mall.QnA.model.QnABoard;

@Repository
public class QnAWriteAnsService_end {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private QnADao qnaDao;
	
	public void qnaWriteAns_end(QnABoard updateQnA) throws Exception {
		
		int updateQnACnt;
		
		qnaDao = sessionTemplate.getMapper(QnADao.class);
		
		qnaDao.reply(updateQnA);
		
	}
	
}
