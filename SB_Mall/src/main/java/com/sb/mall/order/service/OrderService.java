package com.sb.mall.order.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.order.dao.OrderDao;
import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderCartParam;

@Repository
public class OrderService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private OrderDao Dao;
	
	
	@Transactional
	public List<Order> getOrderByDetailNum(String orderDetailNum) {
		List<Order> orders = new ArrayList<Order>();
		Dao = sessionTemplate.getMapper(OrderDao.class);
		orders = Dao.select(orderDetailNum);
		return orders;
	}
	
	public String insertOrders(OrderCartParam orderCartParam) {
		Dao = sessionTemplate.getMapper(OrderDao.class);
		Dao.insertOrderSP(orderCartParam);
		return orderCartParam.getResult();
	}
	
}
