package com.sb.mall.crowd.model;

public class CrowdOrder {
	private int orderSeq;
	private String orderDetailNum;
	private int userSeq;
	private int crowdBoardSeq;
	private String goodsNo;
	private int optionSeq;
	private int quantity;
	private int onePrice;
	private int salePrice;
	private int refund;
	
	private String goodsName;
	private String opt1Name;
	private String opt2Name;
	
	private String crGoodsImg;
	private String userName;
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
	public int getCrowdBoardSeq() {
		return crowdBoardSeq;
	}
	public void setCrowdBoardSeq(int crowdBoardSeq) {
		this.crowdBoardSeq = crowdBoardSeq;
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
	public int getOnePrice() {
		return onePrice;
	}
	public void setOnePrice(int onePrice) {
		this.onePrice = onePrice;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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
	public String getCrGoodsImg() {
		return crGoodsImg;
	}
	public void setCrGoodsImg(String crGoodsImg) {
		this.crGoodsImg = crGoodsImg;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "CrowdOrder [orderSeq=" + orderSeq + ", orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq
				+ ", crowdBoardSeq=" + crowdBoardSeq + ", goodsNo=" + goodsNo + ", optionSeq=" + optionSeq
				+ ", quantity=" + quantity + ", onePrice=" + onePrice + ", salePrice=" + salePrice + ", refund="
				+ refund + ", goodsName=" + goodsName + ", opt1Name=" + opt1Name + ", opt2Name=" + opt2Name
				+ ", crGoodsImg=" + crGoodsImg + ", userName=" + userName + "]";
	}
	
	
	
	

	
	
}
