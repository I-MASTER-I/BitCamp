package com.sb.mall.store.model;

public class SalesBoard {
	
	private int salesSeq;
	private String title;
	private String text;
	private int viewSeq;
	private String writeDate;
	private int userSeq;
	
	@Override
	public String toString() {
		return "SalesBoard [salesSeq=" + salesSeq + ", title=" + title + ", text=" + text + ", viewSeq=" + viewSeq
				+ ", writeDate=" + writeDate + ", userSeq=" + userSeq + "]";
	}
	public int getSalesSeq() {
		return salesSeq;
	}
	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
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
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	
}
