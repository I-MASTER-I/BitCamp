package com.sb.mall.admin.adminStatistics.model;

public class VisitStatVO {
	
	private int dayCount;
	private int monthCount;
	private int yearCount;
	
	public int getDayCount() {
		return dayCount;
	}
	public void setDayCount(int dayCount) {
		this.dayCount = dayCount;
	}
	public int getMonthCount() {
		return monthCount;
	}
	public void setMonthCount(int monthCount) {
		this.monthCount = monthCount;
	}
	public int getYearCount() {
		return yearCount;
	}
	public void setYearCount(int yearCount) {
		this.yearCount = yearCount;
	}
	@Override
	public String toString() {
		return "VisitStatVO [dayCount=" + dayCount + ", monthCount=" + monthCount + ", yearCount=" + yearCount + "]";
	}
	
	
	
	
	
}
