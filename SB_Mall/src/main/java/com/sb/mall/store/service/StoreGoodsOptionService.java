package com.sb.mall.store.service;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.store.dao.StoreDao;
import com.sb.mall.store.model.GoodsOption;

@Service
public class StoreGoodsOptionService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	StoreDao storeDao;

	@Transactional
	public List<GoodsOption> getGoodsOptionList(String goodsNo) throws SQLException{
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		List<GoodsOption> list = storeDao.selectGoodsOptionList(goodsNo);
		return list;
	}
	
	@Transactional
	public GoodsOption getGoodsOption(GoodsOption goodsOption) throws SQLException{
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		goodsOption = storeDao.selectGoodsOption(goodsOption);
		return goodsOption;
	}
	
}
