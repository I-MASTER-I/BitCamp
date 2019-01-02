package com.sb.mall.store.model;


public class Product {
	private int productSeq;
	private int salesSeq;
	private int price;
	private String productName;
	private String photo;
	private String detail;
	
	@Override
	public String toString() {
		return "Product [productSeq=" + productSeq + ", salesSeq=" + salesSeq + ", price=" + price + ", productName="
				+ productName + ", photo=" + photo + ", detail=" + detail + "]";
	}

	public int getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}

	public int getSalesSeq() {
		return salesSeq;
	}

	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
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

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
