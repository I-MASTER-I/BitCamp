package com.sb.mall.crowd.model;

public class CrowdProductPhoto {
	private int crProductPhotoSeq;
	private String productNo;
	private String crPhotoList;
	
	public int getCrProductPhotoSeq() {
		return crProductPhotoSeq;
	}
	public void setCrProductPhotoSeq(int crProductPhotoSeq) {
		this.crProductPhotoSeq = crProductPhotoSeq;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getCrPhotoList() {
		return crPhotoList;
	}
	public void setCrPhotoList(String crPhotoList) {
		this.crPhotoList = crPhotoList;
	}
	@Override
	public String toString() {
		return "CrowdProductPhoto [crProductPhotoSeq=" + crProductPhotoSeq + ", productNo=" + productNo
				+ ", crPhotoList=" + crPhotoList + "]";
	}

	

	

	

}
