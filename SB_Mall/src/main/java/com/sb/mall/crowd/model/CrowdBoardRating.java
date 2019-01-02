package com.sb.mall.crowd.model;

public class CrowdBoardRating {
	private int top;
	private int mid;
	private int bottom;
	private int count;
	
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getBottom() {
		return bottom;
	}
	public void setBottom(int bottom) {
		this.bottom = bottom;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CrowdBoardRating [top=" + top + ", mid=" + mid + ", bottom=" + bottom + ", count=" + count + "]";
	}

}
