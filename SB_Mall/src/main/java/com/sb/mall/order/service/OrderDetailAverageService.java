package com.sb.mall.order.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.order.dao.OrderDetailDao;

@Repository
public class OrderDetailAverageService {

	@Autowired
	SqlSessionTemplate sessionTemplate;

	private OrderDetailDao Dao;

	@Transactional
	public String getAverage(int interval) {

		String result = "";

		Dao = sessionTemplate.getMapper(OrderDetailDao.class);
		
		if (interval == 0) {
			result = Dao.thisMonthAverage();
		} else {
			result =  Dao.preMonthAverage(interval);
		}

		

		return result;
	}
	

}
