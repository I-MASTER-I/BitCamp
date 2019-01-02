package com.sb.mall.order.model;

public class OrderItem {
	
	private int userSeq;
	private String goodsNo;
	private String goodsPhoto;
	private String goodsName;
	private String goodsPrice;
	private int optionSeq;
	private int quantity;
	private int salePrice;
	private String opt1Name;
	private int opt1Price;
	private String opt2Name;
	private int opt2Price;
	
	@Override
	public String toString() {
		return "OrderItem [userSeq=" + userSeq + ", goodsNo=" + goodsNo + ", goodsPhoto=" + goodsPhoto + ", goodsName="
				+ goodsName + ", goodsPrice=" + goodsPrice + ", optionSeq=" + optionSeq + ", quantity=" + quantity
				+ ", salePrice=" + salePrice + ", opt1Name=" + opt1Name + ", opt1Price=" + opt1Price + ", opt2Name="
				+ opt2Name + ", opt2Price=" + opt2Price + "]";
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

	public String getGoodsPhoto() {
		return goodsPhoto;
	}

	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
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

	public String getOpt1Name() {
		return opt1Name;
	}

	public void setOpt1Name(String opt1Name) {
		this.opt1Name = opt1Name;
	}

	public int getOpt1Price() {
		return opt1Price;
	}

	public void setOpt1Price(int opt1Price) {
		this.opt1Price = opt1Price;
	}

	public String getOpt2Name() {
		return opt2Name;
	}

	public void setOpt2Name(String opt2Name) {
		this.opt2Name = opt2Name;
	}

	public int getOpt2Price() {
		return opt2Price;
	}

	public void setOpt2Price(int opt2Price) {
		this.opt2Price = opt2Price;
	}
	
}
