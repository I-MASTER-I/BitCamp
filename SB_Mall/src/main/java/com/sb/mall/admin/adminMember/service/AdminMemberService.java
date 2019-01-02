package com.sb.mall.admin.adminMember.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminMember.dao.AdminMemberDao;
import com.sb.mall.home.model.PageListView;

@Repository
public class AdminMemberService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminMemberDao dao;

	// loadReturnList.jsp에 값 전달
	@Transactional
	public PageListView getMemberVOList(String startDate, String endDate, int pageNumber,
			int countPerPage, int gradeNum, String search) {
		
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

		dao = sqlSessionTemplate.getMapper(AdminMemberDao.class);

		objTotalCount = dao.selectMemberVOCount(startDate, endDate, gradeNum, search);

		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			objList = dao.selectMemberVOList(startDate, endDate, firstRow, endRow, gradeNum, search);
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}

		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}

	// 회원등급 업데이트
	@Transactional
	public void changeGradeNum(List<Object> memberArray, int gradeNum) {

		dao.changeGradeNum(memberArray, gradeNum);

	}
	
	// 회원 삭제
	@Transactional
	public void memberDelete(List<Object> memberArray) {
		
		dao.memberDelete(memberArray);
		
	}

}
