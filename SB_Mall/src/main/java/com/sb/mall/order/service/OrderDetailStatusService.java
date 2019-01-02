package com.sb.mall.order.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.order.dao.OrderDetailDao;
import com.sb.mall.order.model.OrderDetail;

@Repository
public class OrderDetailStatusService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	OrderDetailDao dao;

	@Transactional
	public OrderDetail getOrderDetail(String orderDetailNum) throws SQLException {

		OrderDetail orderDetail;
		
		dao = sqlSessionTemplate.getMapper(OrderDetailDao.class);
		
		dao.updateStatus(orderDetailNum);
		
		orderDetail = dao.selectOrderDetail(orderDetailNum);

		return orderDetail;
	}

}
