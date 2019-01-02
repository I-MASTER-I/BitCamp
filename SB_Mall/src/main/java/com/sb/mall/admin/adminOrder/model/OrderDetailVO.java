package com.sb.mall.admin.adminOrder.model;

public class OrderDetailVO {
	
	private String orderTime;
	private String orderDetailNum;
	private int userSeq;
	private String userName;
	private String orderAddress;
	private String goodsName;
	private int payment;
	private int status;
	private long totalAmount;
	
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
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public long getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(long totalAmount) {
		this.totalAmount = totalAmount;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [orderTime=" + orderTime + ", orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq
				+ ", userName=" + userName + ", orderAddress=" + orderAddress + ", goodsName=" + goodsName
				+ ", payment=" + payment + ", status=" + status + ", totalAmount=" + totalAmount + "]";
	}
	
	
	
	
	
}
