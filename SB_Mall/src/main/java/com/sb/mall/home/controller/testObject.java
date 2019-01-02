package com.sb.mall.home.controller;

public class testObject {

	String quarter;
	int sales;
	int sales2;
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getSales2() {
		return sales2;
	}
	public void setSales2(int sales2) {
		this.sales2 = sales2;
	}
	public testObject(String quarter, int sales, int sales2) {
		super();
		this.quarter = quarter;
		this.sales = sales;
		this.sales2 = sales2;
	}

	

}
