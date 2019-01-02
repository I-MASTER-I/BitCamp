package com.sb.mall.order.model;

import org.springframework.web.multipart.MultipartFile;

public class OrderAndProduct {
		
	private int orderSeq;
	private String orderDetailNum;
	private int userSeq;
	private int quantity;
	private String option;
	private int salePrice;
	private int productSeq;
	private int price;
	private String productName;
	private String photo;
	private MultipartFile photoFile;
	private String detail;
	
	@Override
	public String toString() {
		return "OrderAndProduct [orderSeq=" + orderSeq + ", orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq
				+ ", quantity=" + quantity + ", option=" + option + ", salePrice=" + salePrice + ", productSeq="
				+ productSeq + ", price=" + price + ", productName=" + productName + ", photo=" + photo + ", photoFile="
				+ photoFile + ", detail=" + detail + "]";
	}

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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
}
