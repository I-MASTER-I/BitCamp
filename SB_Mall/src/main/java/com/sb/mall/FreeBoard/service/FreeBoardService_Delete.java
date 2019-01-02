package com.sb.mall.FreeBoard.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.FreeBoard.dao.FreeBoardDao;
import com.sb.mall.FreeBoard.model.FreeBoard;

@Repository
public class FreeBoardService_Delete {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private FreeBoardDao freeBoardDao;
	
	/*Create*/
	@Transactional
	public String freeBoardService_Delete(int boardSeq) throws Exception {
		System.out.println("[freeBoardService_Delete()]");
		System.out.println("/*Deleting..*/");
		
		freeBoardDao = sqlSessionTemplate.getMapper(FreeBoardDao.class);
		
		int resultCnt = 0;
		resultCnt = freeBoardDao.delete_FreeBoard(boardSeq);
		if (resultCnt == 1) {
			System.out.println("/*End of Deleting*/");
			return "[Delete Successful]";
		}else {
			System.out.println("/*End of Deleting*/");
			return "[Delete failed]";
			
		}
	}
}
