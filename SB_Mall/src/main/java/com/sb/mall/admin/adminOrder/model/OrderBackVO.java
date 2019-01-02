package com.sb.mall.admin.adminOrder.model;

public class OrderBackVO {
	
	private String orderDetailNum;
	private int pageNumber;
	private String startDate;
	private String endDate;
	private String tableName;
	private int status;
	private int payment;
	private String search;
	
	public String getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(String orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "OrderResultVO [orderDetailNum=" + orderDetailNum + ", pageNumber=" + pageNumber + ", startDate="
				+ startDate + ", endDate=" + endDate + ", tableName=" + tableName + ", status=" + status + ", payment="
				+ payment + ", search=" + search + "]";
	}
	
	
	

	
	
	
	
	
}
