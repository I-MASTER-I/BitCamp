package com.sb.mall.order.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.order.model.OrderDetail;

public interface OrderDetailDao {
	
	public int insert(OrderDetail orderDetail);
	public int delete(long orderDetailNum);
	public List<OrderDetail> selectAll();
	public List<OrderDetail> selectColumn(Map<String, Object> map); //String where, String column
	public List<OrderDetail> selectJoin(Map<String, Object> map); //String joinTable, String where, String column
	public List<OrderDetail> selectMemberOrderDetail(String userId);
	public OrderDetail selectOrderDetail(String orderDetailNum);
	public String thisMonthAmount();
	public String preMonthAmount(int interval);
	public String thisMonthAverage();
	public String preMonthAverage(int interval);
	public int selectCount();
	public List<Object> selectList(int firstRow, int endRow);
	public List<Object> selectTodayList(int firstRow, int endRow);
	public int updateStatus(String orderDetailNum);
	public List<OrderDetail> selectOrderDetail_userSqe(int userSeq);
	public int selectOrderDetail_Cnt(int userSeq);

}
