package com.sb.mall.FreeBoard.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FreeBoard {
	//게시글번호 not null
	int boardSeq;
	//유저번호
	int userSeq;
	//제목 not null
	String boardTitle;
	//내용 not null
	String boardContent;
	//작성일 not null
	Date boardWriteDate;
	//작성자이름 not null
	String writerName;
	//조회수
	int viewSeq;
	
	
	
	public int getViewSeq() {
		return viewSeq;
	}
	public void setViewSeq(int viewSeq) {
		this.viewSeq = viewSeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriteDate() {
		return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(boardWriteDate);
	}
	public void setBoardWriteDate(Date timestamp) {
		this.boardWriteDate = timestamp;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	@Override
	public String toString() {
		return "<<자유게시판>> [boardSeq=" + boardSeq + ", userSeq=" + userSeq + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardWriteDate=" + boardWriteDate + ", writerName=" + writerName
				+ ", viewSeq=" + viewSeq + "]";
	}
	
}
