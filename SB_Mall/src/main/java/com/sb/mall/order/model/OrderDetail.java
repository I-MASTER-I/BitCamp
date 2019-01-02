package com.sb.mall.order.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDetail {
	private String orderDetailNum;
	private int userSeq;
	private int payment;
	private Date orderTime;
	private int status;
	private int totalAmount;
	private int zipCode;
	private String orderPhone;
	private String orderAddress1;
	private String orderAddress2;
	private String orderRequest;
	
	@Override
	public String toString() {
		return "OrderDetail [orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq + ", payment=" + payment
				+ ", orderTime=" + orderTime + ", status=" + status + ", totalAmount=" + totalAmount + ", zipCode="
				+ zipCode + ", orderPhone=" + orderPhone + ", orderAddress1=" + orderAddress1 + ", orderAddress2="
				+ orderAddress2 + ", orderRequest=" + orderRequest + "]";
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getOrderTime() {
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(orderTime);
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
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

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress1() {
		return orderAddress1;
	}

	public void setOrderAddress1(String orderAddress1) {
		this.orderAddress1 = orderAddress1;
	}

	public String getOrderAddress2() {
		return orderAddress2;
	}

	public void setOrderAddress2(String orderAddress2) {
		this.orderAddress2 = orderAddress2;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	
}
