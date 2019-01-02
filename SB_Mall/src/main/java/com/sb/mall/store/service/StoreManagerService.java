package com.sb.mall.store.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.store.dao.StoreDao;

@Service
public class StoreManagerService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	StoreDao storeDao;
	
	@Transactional
	public void deleteStore(int salSeq) throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		storeDao.deleteSalesBoard(salSeq);
	}
	
}
