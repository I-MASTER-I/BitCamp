package com.sb.mall.member.model;

public class OrderDetailVO {
	
	private String orderTime;
	private String orderDetailNum;
	private String orderAddress;
	private String goodsName;
	private int payment;
	private int status;
	private int totalAmount;
	
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(String orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [orderTime=" + orderTime + ", orderDetailNum=" + orderDetailNum + ", orderAddress="
				+ orderAddress + ", goodsName=" + goodsName + ", payment=" + payment + ", status=" + status
				+ ", totalAmount=" + totalAmount + ", getOrderTime()=" + getOrderTime() + ", getOrderDetailNum()="
				+ getOrderDetailNum() + ", getOrderAddress()=" + getOrderAddress() + ", getGoodsName()="
				+ getGoodsName() + ", getPayment()=" + getPayment() + ", getStatus()=" + getStatus()
				+ ", getTotalAmount()=" + getTotalAmount() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
}
