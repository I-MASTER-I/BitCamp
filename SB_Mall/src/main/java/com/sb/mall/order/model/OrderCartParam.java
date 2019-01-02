package com.sb.mall.order.model;

public class OrderCartParam {
	private String orders;
	private String result;
	
	@Override
	public String toString() {
		return "OrderCartParam [orders=" + orders + ", result=" + result + "]";
	}
	public String getOrders() {
		return orders;
	}
	public void setOrders(String orders) {
		this.orders = orders;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
