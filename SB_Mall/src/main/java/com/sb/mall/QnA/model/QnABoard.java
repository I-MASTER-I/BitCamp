package com.sb.mall.QnA.model;

import java.util.Date;

public class QnABoard {
	
	private int qnaSeq;
	private int userSeq;
	private String qtitle;
	private String qtext;
	private String atext;
	private Date qwriteDate;
	
	
	@Override
	public String toString() {
		return "QnABoard [qnaSeq=" + qnaSeq + ", userSeq=" + userSeq + ", qtitle=" + qtitle + ", qtext=" + qtext
				+ ", atext=" + atext + ", qwriteDate=" + qwriteDate + "]";
	}


	public int getQnaSeq() {
		return qnaSeq;
	}


	public void setQnaSeq(int qnaSeq) {
		this.qnaSeq = qnaSeq;
	}


	public int getUserSeq() {
		return userSeq;
	}


	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}


	public String getQtitle() {
		return qtitle;
	}


	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}


	public String getQtext() {
		return qtext;
	}


	public void setQtext(String qtext) {
		this.qtext = qtext;
	}


	public String getAtext() {
		return atext;
	}


	public void setAtext(String atext) {
		this.atext = atext;
	}


	public Date getQwriteDate() {
		return qwriteDate;
	}


	public void setQwriteDate(Date qwriteDate) {
		this.qwriteDate = qwriteDate;
	}
	
}
