package com.sb.mall.admin.adminOrder.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sb.mall.admin.adminOrder.model.OrderVO;

public interface AdminOrderDao {
	// 일반 주문 및 크라우드펀딩 주문 갯수
	public int selectOrderDetailVOCount(String startDate, String endDate, @Param("tableName") String tableName,
			@Param("status") int status, @Param("payment") int payment, @Param("search") String search);

	// 일반 주문 및 크라우드펀딩 주문 조회
	public List<Object> selectOrderDetailVOList(String startDate, String endDate, @Param("tableName") String tableName,
			int firstRow, int endRow, @Param("status") int status, @Param("payment") int payment,
			@Param("search") String search);

	// 상세 상품 조회
	public List<OrderVO> selectOrderVOList(@Param("tableName") String tableName, String goodsTable,
			String goodsOptionTable, String orderDetailNum);

	// 주문상태 업데이트
	public void changeStatus(@Param("orderDetailArray") List<Object> orderDetailArray, String status, String tableName);

	// 반품 상품 갯수
	public int selectReturnVOCount(String startDate, String endDate, @Param("tableName") String tableName, int refund);

	// 반품 상품 조회
	public List<Object> selectReturnVOList(String startDate, String endDate, @Param("tableName") String tableName,
			int firstRow, int endRow, int refund);

	// 반품상태 업데이트
	public void changeRefund(@Param("orderArray") List<Object> orderArray, String status, String tableName);
}
