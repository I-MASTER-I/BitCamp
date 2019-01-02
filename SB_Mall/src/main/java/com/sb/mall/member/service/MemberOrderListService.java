package com.sb.mall.member.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminOrder.model.OrderBackVO;
import com.sb.mall.home.model.PageListView;
import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.order.model.Order;

@Service
public class MemberOrderListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private MemberDao dao;

	// loadOrderList.jsp에 값 전달
	@Transactional
	public PageListView getOrderDetailVOList(int pageNumber, int countPerPage, String tableName, int userSeq) {

		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;

		// 표시할 페이지
		int currentPageNumber = pageNumber;

		// 메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;

		dao = sqlSessionTemplate.getMapper(MemberDao.class);

		objTotalCount = dao.selectOrderDetailVOCount(tableName, userSeq);

		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			objList = dao.selectOrderDetailVOList(tableName, userSeq, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}

		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}

	// orderResult.jsp에 값 전달
	@Transactional
	public List<Object> getOrderVOList(String tableName, String orderDetailNum) {

		List<Object> orderVOList = new ArrayList<>();

		orderVOList = dao.selectOrderVOList(tableName, orderDetailNum);

		return orderVOList;
	}

	// 반품 요청 프로세스
	@Transactional
	public void changeRefund(String tableName, int orderSeq, int refund, String orderDetailNum) {

		// 반품상태 업데이트
		dao.changeRefund(tableName, orderSeq, refund);

		// 반품 후 OrderDetail의 totalAmount 업데이트
		dao.changeOrderDetail(tableName, orderDetailNum);

	}

}
