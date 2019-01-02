package com.sb.mall.crowd.model;

import java.util.Date;

public class CrowdOrderDetail {
	private int crDetailSeq;
	private String orderDetailNum;
	private int userSeq;
	private int payment;
	private Date orderTime;
	private int status;
	private int totalAmount;
	private String cardNo;
	private String cardPassword;
	private int yearDay;
	private int birthNo;
	private int zipCode;
	private String orderAddress1;
	private String orderAddress2;
	private int orderPhone;
	private String orderRequest;
	private String orderName;
	public int getCrDetailSeq() {
		return crDetailSeq;
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
	public Date getOrderTime() {
		return orderTime;
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
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardPassword() {
		return cardPassword;
	}
	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}
	public int getYearDay() {
		return yearDay;
	}
	public void setYearDay(int yearDay) {
		this.yearDay = yearDay;
	}
	public int getBirthNo() {
		return birthNo;
	}
	public void setBirthNo(int birthNo) {
		this.birthNo = birthNo;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
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
	public int getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(int orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderRequest() {
		return orderRequest;
	}
	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public void setCrDetailSeq(int crDetailSeq) {
		this.crDetailSeq = crDetailSeq;
	}
	@Override
	public String toString() {
		return "CrowdOrderDetail [crDetailSeq=" + crDetailSeq + ", orderDetailNum=" + orderDetailNum + ", userSeq="
				+ userSeq + ", payment=" + payment + ", orderTime=" + orderTime + ", status=" + status
				+ ", totalAmount=" + totalAmount + ", cardNo=" + cardNo + ", cardPassword=" + cardPassword
				+ ", yearDay=" + yearDay + ", birthNo=" + birthNo + ", zipCode=" + zipCode + ", orderAddress1="
				+ orderAddress1 + ", orderAddress2=" + orderAddress2 + ", orderPhone=" + orderPhone + ", orderRequest="
				+ orderRequest + ", orderName=" + orderName + "]";
	}
	
	

}
