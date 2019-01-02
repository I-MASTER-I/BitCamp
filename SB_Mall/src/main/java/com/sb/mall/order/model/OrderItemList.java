package com.sb.mall.order.model;

import java.util.List;

public class OrderItemList {
	
	private List<OrderItem> orders;
	private int orderType;
	
	@Override
	public String toString() {
		return "OrderItemList [orders=" + orders + ", orderType=" + orderType + "]";
	}
	public List<OrderItem> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderItem> orders) {
		this.orders = orders;
	}
	public int getOrderType() {
		return orderType;
	}
	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
}
