package com.sb.mall.order.model;

import java.util.List;

public class OrderOrderCommand {
	
	private List<Order> orders;
	private OrderDetail orderDetail;
	
	@Override
	public String toString() {
		return "OrderOrderCommand [orders=" + orders + ", orderDetail=" + orderDetail + "]";
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	
}
