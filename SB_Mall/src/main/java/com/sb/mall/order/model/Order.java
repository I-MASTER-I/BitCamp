package com.sb.mall.order.model;

public class Order {
	private int orderSeq;
	private String orderDetailNum;
	private int userSeq;
	private String goodsNo;
	private int optionSeq;
	private int quantity;
	private int salePrice;
	
	@Override
	public String toString() {
		return "Order [orderSeq=" + orderSeq + ", orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq
				+ ", goodsNo=" + goodsNo + ", optionSeq=" + optionSeq + ", quantity=" + quantity + ", salePrice="
				+ salePrice + "]";
	}

	public int getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
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

	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getOptionSeq() {
		return optionSeq;
	}

	public void setOptionSeq(int optionSeq) {
		this.optionSeq = optionSeq;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	
}
