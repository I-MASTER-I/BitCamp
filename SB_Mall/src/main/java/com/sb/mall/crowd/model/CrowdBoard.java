package com.sb.mall.crowd.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CrowdBoard {
	private int crowdBoardSeq;
	private int userSeq;
	private String title;
	private String text;
	private int viewSeq;
	private Date writeDate;
	private Date salesDay;
	private int targetPrice;
	private int totalOrderPrice;
	private int leftDays;
	private int achieve;
	
	public int getCrowdBoardSeq() {
		return crowdBoardSeq;
	}
	public void setCrowdBoardSeq(int crowdBoardSeq) {
		this.crowdBoardSeq = crowdBoardSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getViewSeq() {
		return viewSeq;
	}
	public void setViewSeq(int viewSeq) {
		this.viewSeq = viewSeq;
	}
	public String getWriteDate() {
		Date date = new Date();
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(date);
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getSalesDay() {
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.DATE , +30);
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(mon.getTime());
	}
	public void setSalesDay(Date salesDay) {
		this.salesDay = salesDay;
	}
	public int getTargetPrice() {
		return targetPrice;
	}
	public void setTargetPrice(int targetPrice) {
		this.targetPrice = targetPrice;
	}
	
	public int getTotalOrderPrice() {
		return totalOrderPrice;
	}
	public void setTotalOrderPrice(int totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}
	public int getLeftDays() {
		return leftDays;
	}
	public void setLeftDays(int leftDays) {
		this.leftDays = leftDays;
	}
	public int getAchieve() {
		return achieve;
	}
	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}
	@Override
	public String toString() {
		return "CrowdBoard [crowdBoardSeq=" + crowdBoardSeq + ", userSeq=" + userSeq + ", title=" + title + ", text="
				+ text + ", viewSeq=" + viewSeq + ", writeDate=" + writeDate + ", salesDay=" + salesDay
				+ ", targetPrice=" + targetPrice + ", totalOrderPrice=" + totalOrderPrice + ", leftDays=" + leftDays
				+ ", achieve=" + achieve + "]";
	}


	
	
}
