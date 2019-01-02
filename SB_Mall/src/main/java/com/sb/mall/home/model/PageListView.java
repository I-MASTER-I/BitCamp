package com.sb.mall.home.model;

import java.util.List;


public class PageListView {
	private int objTotalCount; //조회된 행의 갯수
	private int currentPageNumber;
	private List<Object> objList;
	private int pageTotalCount; //총 페이지 갯수
	private int objCountPerPage; //한페이지당 보여줄 행의 갯수
	private int firstRow; //시작 행
	private int endRow; //objCountPerPage와 같다
	private int startPage; // 게시글 번호에 따른 (보여지는)페이지의 시작 번호
	private int endPage; // 게시글 번호에 따른 (보여지는)페이지의 마지막 번호
	private int displayPageNum = 10; //
	
	public PageListView(List<Object> objList, int objtotalCount, int currentPageNumber,
			int objCountPerPage, int firstRow, int endRow) {
		this.objList = objList;
		this.objTotalCount = objtotalCount;
		this.currentPageNumber = currentPageNumber;
		this.objCountPerPage = objCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}
	
	//페이지 계산하기 - 메세지 총 갯수가 0이면 페이지 총 갯수도 0이다.
	//메세지 총 갯수가 0이 아니면 메세지 페이지 총 갯수는 메세지 총 갯수 / 10이다.
	//여기서 메세지 총 갯수를 10으로 나눈 나머지가 0보다 크면 페이지 총 갯수에 하나 더 추가해준다.
	private void calculatePageTotalCount() {
		
        endPage = (int) (Math.ceil(currentPageNumber / (double) displayPageNum) * displayPageNum); //현재 보여줄 끝 페이지 계산
        
        startPage = (endPage - displayPageNum) + 1; //현재 보여줄 첫 페이지 계산 예 : 11페이지면 endPage가 20이고 -11해서 9 + 1 = 10 이 첫 페이지임
 
        pageTotalCount = (int) (Math.ceil(objTotalCount / (double) objCountPerPage)); //총 게시글 갯수 / 한페이지에 표시할 갯수 
 
        if (endPage > pageTotalCount)  //끝페이지가 페이지 총 갯수보다 많으면 끝페이지를 페이지 총 갯수로 수정한다.
            endPage = pageTotalCount;
		
	}
	
	public boolean isEmpty() {
		return objTotalCount == 0;
	}
	
	public int getObjTotalCount() {
		return objTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public List<Object> getObjList() {
		return objList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public int getObjCountPerPage() {
		return objCountPerPage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public int getEndRow() {
		return endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}
	


	
}
