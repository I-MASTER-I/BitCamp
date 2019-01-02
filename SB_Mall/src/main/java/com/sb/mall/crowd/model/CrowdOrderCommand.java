package com.sb.mall.crowd.model;

import java.util.List;

public class CrowdOrderCommand {
	private List<CrowdOrder> orderList;
	private CrowdOrderDetail orderDetail;
	
	public List<CrowdOrder> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<CrowdOrder> orderList) {
		this.orderList = orderList;
	}
	public CrowdOrderDetail getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(CrowdOrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	@Override
	public String toString() {
		return "CrowdOrderCommand [orderList=" + orderList + ", orderDetail=" + orderDetail + "]";
	}

}
