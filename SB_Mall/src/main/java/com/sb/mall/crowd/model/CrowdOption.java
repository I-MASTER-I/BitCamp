package com.sb.mall.crowd.model;

public class CrowdOption {
	private int optionSeq;
	private String goodsNo;
	private String opt1Name;
	private int crOpt1Price;
	private String opt2Name;
	private int crOpt2Price;
	private int crOptAmount;
	public int getOptionSeq() {
		return optionSeq;
	}
	public void setOptionSeq(int optionSeq) {
		this.optionSeq = optionSeq;
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getOpt1Name() {
		return opt1Name;
	}
	public void setOpt1Name(String opt1Name) {
		this.opt1Name = opt1Name;
	}
	public int getCrOpt1Price() {
		return crOpt1Price;
	}
	public void setCrOpt1Price(int crOpt1Price) {
		this.crOpt1Price = crOpt1Price;
	}
	public String getOpt2Name() {
		return opt2Name;
	}
	public void setOpt2Name(String opt2Name) {
		this.opt2Name = opt2Name;
	}
	public int getCrOpt2Price() {
		return crOpt2Price;
	}
	public void setCrOpt2Price(int crOpt2Price) {
		this.crOpt2Price = crOpt2Price;
	}
	public int getCrOptAmount() {
		return crOptAmount;
	}
	public void setCrOptAmount(int crOptAmount) {
		this.crOptAmount = crOptAmount;
	}
	@Override
	public String toString() {
		return "CrowdOption [optionSeq=" + optionSeq + ", goodsNo=" + goodsNo + ", opt1Name=" + opt1Name
				+ ", crOpt1Price=" + crOpt1Price + ", opt2Name=" + opt2Name + ", crOpt2Price=" + crOpt2Price
				+ ", crOptAmount=" + crOptAmount + ", getOptionSeq()=" + getOptionSeq() + ", getGoodsNo()="
				+ getGoodsNo() + ", getOpt1Name()=" + getOpt1Name() + ", getCrOpt1Price()=" + getCrOpt1Price()
				+ ", getOpt2Name()=" + getOpt2Name() + ", getCrOpt2Price()=" + getCrOpt2Price() + ", getCrOptAmount()="
				+ getCrOptAmount() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
	
	
}
