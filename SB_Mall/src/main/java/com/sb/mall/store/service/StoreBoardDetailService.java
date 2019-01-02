package com.sb.mall.store.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.store.dao.StoreDao;

@Service
public class StoreBoardDetailService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private StoreDao storeDao;
	
	@Transactional
	public Map<String,Object> SalDetailView(int salSeq) throws SQLException{
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		Map<String,Object> proAndSal = new HashMap<String, Object>();
			 proAndSal = storeDao.selectProAndSal(salSeq);
			 storeDao.updateSalBoardCnt(salSeq);
		return proAndSal;
	}
	
}
