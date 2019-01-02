package com.sb.mall.crowd.model;

import org.springframework.web.multipart.MultipartFile;

public class CrowdProduct {
	private int crProductSeq;
	private String productNo;
	private int crowdBoardSeq;
	private int crPrice;
	private String crProductName;
	private String crPhoto;
	private MultipartFile photoFile;
	private String crDetail;
	public int getCrProductSeq() {
		return crProductSeq;
	}
	
	public void setCrProductSeq(int crProductSeq) {
		this.crProductSeq = crProductSeq;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public int getCrowdBoardSeq() {
		return crowdBoardSeq;
	}
	public void setCrowdBoardSeq(int crowdBoardSeq) {
		this.crowdBoardSeq = crowdBoardSeq;
	}
	public int getCrPrice() {
		return crPrice;
	}
	public void setCrPrice(int crPrice) {
		this.crPrice = crPrice;
	}
	public String getCrProductName() {
		return crProductName;
	}
	public void setCrProductName(String crProductName) {
		this.crProductName = crProductName;
	}
	public String getCrPhoto() {
		return crPhoto;
	}
	public void setCrPhoto(String crPhoto) {
		this.crPhoto = crPhoto;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	public String getCrDetail() {
		return crDetail;
	}
	public void setCrDetail(String crDetail) {
		this.crDetail = crDetail;
	}
	
	@Override
	public String toString() {
		return "CrowdProduct [crProductSeq=" + crProductSeq + ", productNo=" + productNo + ", crowdBoardSeq="
				+ crowdBoardSeq + ", crPrice=" + crPrice + ", crProductName=" + crProductName + ", crPhoto=" + crPhoto
				+ ", photoFile=" + photoFile + ", crDetail=" + crDetail + "]";
	}
	
	
	
}
