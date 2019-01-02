package com.sb.mall.member.model;

public class OrderVO {
	
	private String orderDetailNum;
	private int orderSeq;
	private String goodsPhoto;
	private String goodsNo;
	private String goodsName;
	private int quantity;
	private String opt1Name;
	private String opt2Name;
	private int salePrice;
	private int refund;
	
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public String getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(String orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public String getGoodsPhoto() {
		return goodsPhoto;
	}
	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getOpt1Name() {
		return opt1Name;
	}
	public void setOpt1Name(String opt1Name) {
		this.opt1Name = opt1Name;
	}
	public String getOpt2Name() {
		return opt2Name;
	}
	public void setOpt2Name(String opt2Name) {
		this.opt2Name = opt2Name;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	@Override
	public String toString() {
		return "OrderVO [orderDetailNum=" + orderDetailNum + ", orderSeq=" + orderSeq + ", goodsPhoto=" + goodsPhoto
				+ ", goodsNo=" + goodsNo + ", goodsName=" + goodsName + ", quantity=" + quantity + ", opt1Name="
				+ opt1Name + ", opt2Name=" + opt2Name + ", salePrice=" + salePrice + ", refund=" + refund + "]";
	}
	
	
}
