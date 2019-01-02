package com.sb.mall.QnA.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.QnA.dao.QnADao;
import com.sb.mall.QnA.model.QnABoard;
import com.sb.mall.member.model.MemberInfo;

@Service
public class QnAWriteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private QnADao qnaDao;
	
	@Transactional
	public void qnaWrite(MemberInfo memberInfo, QnABoard qnaBoard) {
		
		qnaDao = sqlSessionTemplate.getMapper(QnADao.class);
		
		try {
			qnaBoard.setUserSeq(memberInfo.getUserSeq());
			qnaDao.create(qnaBoard);
			System.out.println("qnaDao : " + qnaDao);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
