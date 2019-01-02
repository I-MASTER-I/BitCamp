package com.sb.mall.FreeBoard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.FreeBoard.dao.FreeBoardDao;
import com.sb.mall.FreeBoard.model.FreeBoard;

@Repository
public class FreeBoard_ListView_Service {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private FreeBoardDao freeBoardDao;
	
	FreeBoard freeBoard;
	
	/*Create*/
	@Transactional
	public List<FreeBoard> freeBoardListView() {
		
		freeBoardDao = sqlSessionTemplate.getMapper(FreeBoardDao.class);
		
		List<FreeBoard> list = null;
		
		try {
			list = freeBoardDao.selectAll_FreeBoard();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
