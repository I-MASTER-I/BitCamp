package com.sb.mall.FreeBoard.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.FreeBoard.dao.FreeBoardDao;
import com.sb.mall.FreeBoard.model.FreeBoard;

@Repository
public class FreeBoardService_Select {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private FreeBoardDao freeBoardDao;
	
	/*Create*/
	@Transactional
	public FreeBoard freeBoardService_Select(int boardSeq) throws Exception {
		System.out.println("[freeBoardService_Select()]");
		System.out.println("/*Selecting..*/");
		
		freeBoardDao = sqlSessionTemplate.getMapper(FreeBoardDao.class);
		
		FreeBoard resultObject = null;
		resultObject = freeBoardDao.select_FreeBoard(boardSeq);
		
		System.out.println("/*End of Selecting*/");
		return resultObject;
		
	}

}
