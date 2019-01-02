package com.sb.mall.crowd.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CrowdReply {
	private int crReplySeq;
	private String crReply;
	private Date crRegTime;
	private int userSeq;
	private int crowdBoardSeq;
	private int rating;
	public int getCrReplySeq() {
		return crReplySeq;
	}
	public void setCrReplySeq(int crReplySeq) {
		this.crReplySeq = crReplySeq;
	}
	public String getCrReply() {
		return crReply;
	}
	public void setCrReply(String crReply) {
		this.crReply = crReply;
	}
	public Date getCrRegTime() {
		return crRegTime;
	}
	public void setCrRegTime(Date crRegTime) {
		this.crRegTime = crRegTime;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getCrowdBoardSeq() {
		return crowdBoardSeq;
	}
	public void setCrowdBoardSeq(int crowdBoardSeq) {
		this.crowdBoardSeq = crowdBoardSeq;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "CrowdReply [crReplySeq=" + crReplySeq + ", crReply=" + crReply + ", crRegTime=" + crRegTime
				+ ", userSeq=" + userSeq + ", crowdBoardSeq=" + crowdBoardSeq + ", rating=" + rating + "]";
	}
	
}
