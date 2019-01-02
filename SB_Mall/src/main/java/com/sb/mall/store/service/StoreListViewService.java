package com.sb.mall.store.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.mall.store.dao.StoreDao;
import com.sb.mall.store.model.Product;
import com.sb.mall.store.model.SalesBoard;

@Service
public class StoreListViewService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private StoreDao storeDao;
	

	public List<Map<String,Object>> proAndSalList(String tag) throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			/*list = storeDao.selectProAndSalList(tag);*/
		return list;
	};
	
	public List<Product> productList() throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<Product> list = new ArrayList<Product>();
				list = storeDao.selectProductList();
		return list;
	}
	
	public List<SalesBoard> salBoardList() throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<SalesBoard> list = new ArrayList<SalesBoard>();
			list = storeDao.selectSalBoardList();
		return list;
	}
	
	
}
