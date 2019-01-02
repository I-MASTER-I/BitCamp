package com.sb.mall.order.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.order.dao.OrderDao;
import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderCartParam;

@Service
public class OrderCartService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private OrderDao orderDao;
	
	@Transactional
	public String addCart(OrderCartParam orderCartParam) {
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		orderDao.upsertCart(orderCartParam);
		return orderCartParam.getResult();
	}
	
	@Transactional
	public void deleteCart(List<Order> orders) throws SQLException {
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		orderDao.deleteCart(orders);
	}
	
	public List<Map<String,Object>> selectCarts(int userSeq) throws SQLException{
		List<Map<String,Object>> list = null;
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		list= orderDao.selectCarts(userSeq);
		return list;
	}
	
	@Transactional
	public List<Map<String,Object>> selectCartForOrder(List<Order> orders) throws SQLException{
		List<Map<String,Object>> list = null;
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		list= orderDao.selectCartForOrder(orders);
		return list;
	}
	
}
