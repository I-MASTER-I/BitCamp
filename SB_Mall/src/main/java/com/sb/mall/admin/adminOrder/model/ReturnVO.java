package com.sb.mall.admin.adminOrder.model;

public class ReturnVO {
	
	private int orderSeq;
	private int userSeq;
	private String userName;
	private String goodsNo;
	private String goodsName;
	private int quantity;
	private String opt1Name;
	private String opt2Name;
	private int refund;
	private long salePrice;
	
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
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public long getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(long salePrice) {
		this.salePrice = salePrice;
	}
	@Override
	public String toString() {
		return "ReturnVO [orderSeq=" + orderSeq + ", userSeq=" + userSeq + ", userName=" + userName + ", goodsNo="
				+ goodsNo + ", goodsName=" + goodsName + ", quantity=" + quantity + ", opt1Name=" + opt1Name
				+ ", opt2Name=" + opt2Name + ", salePrice=" + salePrice + "]";
	}

	
	

	
	

}
