package com.sb.mall.crowd.model;

import java.util.List;

public class CrowdOrderList {
	private List<CrowdOrder> orders;

	public List<CrowdOrder> getOrders() {
		return orders;
	}

	public void setOrders(List<CrowdOrder> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "CrowdOrderList [orders=" + orders + "]";
	}
}
