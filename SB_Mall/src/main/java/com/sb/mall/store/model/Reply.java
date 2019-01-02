package com.sb.mall.store.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
	private int replySeq;
	private String reply;
	private Date regTime;
	private int userSeq;
	private int salesSeq;
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getRegTime() {
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(regTime);
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getSalesSeq() {
		return salesSeq;
	}
	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
	}
	@Override
	public String toString() {
		return "Reply [replySeq=" + replySeq + ", reply=" + reply + ", regTime=" + regTime + ", userSeq=" + userSeq
				+ ", salesSeq=" + salesSeq + "]";
	}
	
	
}
