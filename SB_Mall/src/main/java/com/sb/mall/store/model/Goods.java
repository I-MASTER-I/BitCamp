package com.sb.mall.store.model;

public class Goods {
	
	private String goodsNo;
	private int productSeq;
	private String goodsName;
	private int goodsPrice;
	private String goodsPhoto;
	
	@Override
	public String toString() {
		return "Goods [goodsNo=" + goodsNo + ", productSeq=" + productSeq + ", goodsName=" + goodsName + ", goodsPrice="
				+ goodsPrice + ", goodsPhoto=" + goodsPhoto + "]";
	}

	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsPhoto() {
		return goodsPhoto;
	}

	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}
	
}
