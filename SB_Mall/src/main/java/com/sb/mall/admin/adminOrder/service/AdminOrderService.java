package com.sb.mall.admin.adminOrder.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminOrder.dao.AdminOrderDao;
import com.sb.mall.admin.adminOrder.model.OrderBackVO;
import com.sb.mall.admin.adminOrder.model.OrderVO;
import com.sb.mall.home.model.PageListView;

@Repository
public class AdminOrderService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminOrderDao dao;
		
		//loadOrderList.jsp에 값 전달
		@Transactional
		public PageListView getOrderDetailVOList(String startDate, String endDate, 
				String tableName, int pageNumber, int countPerPage,
				int status, int payment, String search) {
			
			if (search == null || search.equals("")) {
				search = "-1";
			}

			// 전체 메시지 구하기
			// 메세지 갯수
			int objTotalCount = 0;

			// 표시할 페이지
			int currentPageNumber = pageNumber;

			// 메세지가 담길 리스트
			List<Object> objList = null;
			int firstRow = 0;
			int endRow = 0;

			dao = sqlSessionTemplate.getMapper(AdminOrderDao.class);
			
			objTotalCount = dao.selectOrderDetailVOCount(startDate, endDate, tableName, status, payment, search);

			// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
			// 마지막 행에는 표시할 페이지 갯수를 적는다.
			if (objTotalCount > 0) {
				firstRow = (pageNumber - 1) * countPerPage;
				endRow = countPerPage;
				// 현재 페이지에 표시할 메세지를 가져온다.
					objList = dao.selectOrderDetailVOList(startDate, endDate, tableName, firstRow, endRow, status, payment, search);
			} else {
				currentPageNumber = 0;
				objList = Collections.emptyList();
			}

			return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
		}
		
		//orderResult.jsp에 값 전달
		@Transactional
		public List<OrderVO> getOrderVOList(OrderBackVO orderBackVO) {
			
			List<OrderVO> orderVOList = new ArrayList<>();
			
			//컬럼을 조회할 조건들을 불러온다.
			String orderDetailNum = orderBackVO.getOrderDetailNum();
			String tableName = orderBackVO.getTableName();
			String goodsTable = "Goods";
			String goodsOptionTable = "GoodsOption"; 
			if (tableName != null && !(tableName.equals("")) && tableName.equals("CrowdOrderDetail")) {
				goodsTable = "Crowd" + goodsTable;
				goodsOptionTable = "Crowd" + goodsOptionTable;
			} 
			
		   orderVOList = dao.selectOrderVOList(tableName, goodsTable, goodsOptionTable, orderDetailNum);
			
			return orderVOList;
		}
		
		//주문 상태 업데이트
		@Transactional
		public void changeStatus(List<Object> orderDetailArray, String status, String tableName) {
			
			dao.changeStatus(orderDetailArray, status, tableName);
			
		}
		
		//loadReturnList.jsp에 값 전달
		@Transactional
		public PageListView getReturnVOList(String startDate, String endDate, 
				String tableName, int pageNumber, int countPerPage, int refund) {
			
			// 전체 메시지 구하기
			// 메세지 갯수
			int objTotalCount = 0;

			// 표시할 페이지
			int currentPageNumber = pageNumber;

			// 메세지가 담길 리스트
			List<Object> objList = null;
			int firstRow = 0;
			int endRow = 0;

			dao = sqlSessionTemplate.getMapper(AdminOrderDao.class);
			
			objTotalCount = dao.selectReturnVOCount(startDate, endDate, tableName, refund);

			// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
			// 마지막 행에는 표시할 페이지 갯수를 적는다.
			if (objTotalCount > 0) {
				firstRow = (pageNumber - 1) * countPerPage;
				endRow = countPerPage;
				// 현재 페이지에 표시할 메세지를 가져온다.
					objList = dao.selectReturnVOList(startDate, endDate, tableName, firstRow, endRow, refund);
			} else {
				currentPageNumber = 0;
				objList = Collections.emptyList();
			}

			return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
		}
		
		//반품 상태 업데이트
		@Transactional
		public void changeRefund(List<Object> orderArray, String refund, String tableName) {
			
			dao.changeRefund(orderArray, refund, tableName);
			
		}


}
