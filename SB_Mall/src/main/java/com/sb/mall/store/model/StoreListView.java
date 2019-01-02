package com.sb.mall.store.model;

import java.util.List;
import java.util.Map;

public class StoreListView {
	
	private int totalCount;
	private int currentPageNumber;
	private List<Map<String,Object>> storeList;
	private int pageTotalCount;
	private int countPerPage;
	private int firstRow;
	private int endRow;
	
	public StoreListView(List<Map<String,Object>> storeList, int totalCount, int currentPageNumber,
			int countPerPage, int firstRow, int endRow) {
		this.storeList = storeList;
		this.totalCount = totalCount;
		this.currentPageNumber = currentPageNumber;
		this.countPerPage = countPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}
	
	//페이지 계산하기 - 메세지 총 갯수가 0이면 페이지 총 갯수도 0이다.
	//메세지 총 갯수가 0이 아니면 메세지 페이지 총 갯수는 메세지 총 갯수 / 10이다.
	//여기서 메세지 총 갯수를 10으로 나눈 나머지가 0보다 크면 페이지 총 갯수에 하나 더 추가해준다.
	private void calculatePageTotalCount() {
		if (totalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = totalCount / countPerPage;
			if (totalCount % countPerPage > 0) {
				pageTotalCount++;
			}
		}

	}
	
	public boolean isEmpty() {
		return totalCount == 0;
	}

	public int gettotalCount() {
		return totalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Map<String, Object>> getStoreList() {
		return storeList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getcountPerPage() {
		return countPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
}
