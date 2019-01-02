package com.sb.mall.admin.adminOperation.model;

public class SalVO {
	
	private String orderTime;
	private int orderCount;
	private int visitCount;
	private long amount;
	
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "SalVO [orderTime=" + orderTime + ", orderCount=" + orderCount + ", visitCount=" + visitCount
				+ ", amount=" + amount + "]";
	}
	
	
	
}
