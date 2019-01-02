package com.sb.mall.admin.adminMember.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminMemberDao {
	
	// 회원수
	public int selectMemberVOCount(String startDate, String endDate, @Param("gradeNum") int gradeNum, @Param("search") String search);

	// 회원 조회
	public List<Object> selectMemberVOList(String startDate, String endDate, int firstRow, int endRow,
			@Param("gradeNum") int gradeNum, @Param("search") String search);

	// 회원등급 업데이트
	public void changeGradeNum(@Param("memberArray") List<Object> memberArray, int gradeNum);
	
	// 회원 삭제
	public void memberDelete(@Param("memberArray") List<Object> memberArray);
}
