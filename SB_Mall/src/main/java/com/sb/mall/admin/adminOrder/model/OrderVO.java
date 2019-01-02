package com.sb.mall.admin.adminOrder.model;

public class OrderVO {
	
	private String orderDetailNum;
	private int userSeq;
	private String userName;
	private int orderSeq;
	private String goodsPhoto;
	private String goodsNo;
	private String goodsName;
	private int quantity;
	private String opt1Name;
	private String opt2Name;
	private long salePrice;
	
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
	public long getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(long salePrice) {
		this.salePrice = salePrice;
	}
	@Override
	public String toString() {
		return "OrderVO [orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq + ", userName=" + userName
				+ ", orderSeq=" + orderSeq + ", goodsPhoto=" + goodsPhoto + ", goodsNo=" + goodsNo + ", goodsName="
				+ goodsName + ", quantity=" + quantity + ", opt1Name=" + opt1Name + ", opt2Name=" + opt2Name
				+ ", salePrice=" + salePrice + ", getOrderDetailNum()=" + getOrderDetailNum() + ", getUserSeq()="
				+ getUserSeq() + ", getUserName()=" + getUserName() + ", getOrderSeq()=" + getOrderSeq()
				+ ", getGoodsPhoto()=" + getGoodsPhoto() + ", getGoodsNo()=" + getGoodsNo() + ", getGoodsName()="
				+ getGoodsName() + ", getQuantity()=" + getQuantity() + ", getOpt1Name()=" + getOpt1Name()
				+ ", getOpt2Name()=" + getOpt2Name() + ", getSalePrice()=" + getSalePrice() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
