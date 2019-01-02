package com.sb.mall.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sb.mall.admin.adminOrder.model.OrderVO;
import com.sb.mall.member.model.MemberInfo;

public interface MemberDao {

	public int insert(MemberInfo memberInfo);

	public MemberInfo selectById(String userId);

	public List<MemberInfo> selectAll();

	public int updateMember(MemberInfo memberInfo);

	public int updatePw(MemberInfo memberInfo);

	public int delete(String userId);

	public int selectCount();

	public List<Object> selectList(int firstRow, int endRow);

	public List<Object> selectTodayList(int firstRow, int endRow);

	public List<MemberInfo> find_id(String userName, String phone);

	public String find_pw(String userId, String userName);

	public String checkPw(String id);

	// 일반 주문 및 크라우드펀딩 주문 갯수
	public int selectOrderDetailVOCount(@Param("tableName") String tableName, int userSeq);
	
	// 일반 주문 및 크라우드펀딩 주문 조회
	public List<Object> selectOrderDetailVOList(@Param("tableName") String tableName, int userSeq, int firstRow, int endRow);
	
	// 상세 상품 조회
	public List<Object> selectOrderVOList(@Param("tableName") String tableName, String orderDetailNum);
	
	// 반품상태 업데이트
	public void changeRefund(@Param("tableName") String tableName, int orderSeq, int refund);
	
	// 반품 후 OrderDetail의 totalAmount 업데이트
	public void changeOrderDetail(@Param("tableName") String tableName, String orderDetailNum);
}
