package com.sb.mall.crowd.model;

import org.springframework.web.multipart.MultipartFile;

public class CrowdGoods {
	private String goodsNo;
	private int crProductSeq;
	private String goodsName;
	private int crGoodsPrice;
	private String goodsPhoto;
	private MultipartFile goodsFile;
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getCrProductSeq() {
		return crProductSeq;
	}
	public void setCrProductSeq(int crProductSeq) {
		this.crProductSeq = crProductSeq;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getCrGoodsPrice() {
		return crGoodsPrice;
	}
	public void setCrGoodsPrice(int crGoodsPrice) {
		this.crGoodsPrice = crGoodsPrice;
	}
	public String getGoodsPhoto() {
		return goodsPhoto;
	}
	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}
	public MultipartFile getGoodsFile() {
		return goodsFile;
	}
	public void setGoodsFile(MultipartFile goodsFile) {
		this.goodsFile = goodsFile;
	}
	@Override
	public String toString() {
		return "CrowdGoods [goodsNo=" + goodsNo + ", crProductSeq=" + crProductSeq + ", goodsName=" + goodsName
				+ ", crGoodsPrice=" + crGoodsPrice + ", goodsPhoto=" + goodsPhoto + ", goodsFile=" + goodsFile + "]";
	}
	
	
	
	
}
