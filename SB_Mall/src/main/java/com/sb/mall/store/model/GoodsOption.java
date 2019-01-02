package com.sb.mall.store.model;

public class GoodsOption {
	
	private int optionSeq;
	private String goodsNo;
	private String opt1Name;
	private int opt1Price;
	private int opt1Val;
	private String opt2Name;
	private int opt2Price;
	private int opt2Val;
	
	@Override
	public String toString() {
		return "GoodsOption [optionSeq=" + optionSeq + ", goodsNo=" + goodsNo + ", opt1Name=" + opt1Name
				+ ", opt1Price=" + opt1Price + ", opt1Val=" + opt1Val + ", opt2Name=" + opt2Name + ", opt2Price="
				+ opt2Price + ", opt2Val=" + opt2Val + "]";
	}

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

	public int getOpt1Price() {
		return opt1Price;
	}

	public void setOpt1Price(int opt1Price) {
		this.opt1Price = opt1Price;
	}

	public int getOpt1Val() {
		return opt1Val;
	}

	public void setOpt1Val(int opt1Val) {
		this.opt1Val = opt1Val;
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

	public int getOpt2Val() {
		return opt2Val;
	}

	public void setOpt2Val(int opt2Val) {
		this.opt2Val = opt2Val;
	}
	
}
