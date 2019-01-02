package com.sb.mall.admin.adminOperation.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminOperation.dao.AdminOperationDao;
import com.sb.mall.admin.adminOperation.model.BudgetVO;
import com.sb.mall.admin.adminOperation.model.SalVO;
import com.sb.mall.admin.adminOperation.model.TotalReportVO;
import com.sb.mall.home.model.PageListView;

@Repository
public class AdminOperationService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminOperationDao dao;
	
	
	//loadBottomReport.jsp에서 사용할 데이터 수집
	@Transactional
	public TotalReportVO getTotalReportVO(Object nowYear) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		TotalReportVO totalReportVO = new TotalReportVO();
		
		//dao의 메서드 실행하여 totalReportVO에 값 할당
		totalReportVO.setTotalBudget(dao.totalBudget(nowYear));
		totalReportVO.setYearAmount(dao.yearAmount(nowYear));		
		totalReportVO.setDailySalesOrerCount(dao.dailySalesOrerCount(nowYear));
		totalReportVO.setVisitCount(dao.visitCount(nowYear));
		totalReportVO.setNewMember(dao.newMember(nowYear));
		totalReportVO.setTotalCostSales(dao.totalCostSales(nowYear));
		totalReportVO.setLaborCost(dao.laborCost(nowYear));
		totalReportVO.setUtilSupllie(dao.utilSupllie(nowYear));
		totalReportVO.setRent(dao.rent(nowYear));
		
		//totalReportVO의 변수값을 언바인딩 및 계산하여 변수 값 할당 완료
		totalReportVO.setTotalResultBinding();

		return totalReportVO;
	}
	
	//loadBudgetReport.jsp에서 사용할 데이터 수집
	@Transactional
	public BudgetVO getBudgetVO(Object nowYear) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		BudgetVO budgetVO = new BudgetVO();
		
		//dao의 메서드 실행하여 budgetVO에 값 할당
		budgetVO = dao.selectBudget(nowYear);
		budgetVO.setNowYear((String)nowYear);
		
		return budgetVO;
	}
	
	//loadBudgetReport.jsp에서 값을 받아와서 수정
	@Transactional
	public void updateBudget(BudgetVO budgetVO) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		budgetVO.sumYearBudget();
		
		//dao의 메서드 실행하여 budgetVO에 값 할당
		dao.updateBudget(budgetVO);
		
	}
	
	//loadBudgetReport.jsp에서 값을 받아와서 입력
	@Transactional
	public void insertBudget(Object nowYear) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		//dao의 메서드 실행하여 budgetVO에 값 할당
		dao.insertBudget(nowYear);
		
	}
	
	//dailySal.jsp에 값 전달
	@Transactional
	public PageListView getDailySalVOList(String startDate, String endDate, String tableName, int pageNumber, int countPerPage) {

		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;

		// 표시할 페이지
		int currentPageNumber = pageNumber;

		// 메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;

		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		objTotalCount = dao.selectOrderDetailCount(startDate, endDate, tableName);

		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
				objList = dao.selectDailySalVOList(startDate, endDate, tableName, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}

		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}
	
	
	//monthlySal.jsp에 값 전달
	@Transactional
	public PageListView getMonthlySalVOList(String startDate, String endDate, String tableName, int pageNumber, int countPerPage) {
		
		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;
		
		// 표시할 페이지
		int currentPageNumber = pageNumber;
		
		// 메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		objTotalCount = dao.selectMonthlyOrderDetailCount(startDate, endDate, tableName);
		
		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			objList = dao.selectMonthlySalVOList(startDate, endDate, tableName, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}
		
		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}
	
	
	//weeklySal.jsp에 값 전달
	@Transactional
	public PageListView getWeeklySalVOList(String startDate, String endDate, String tableName, int pageNumber, int countPerPage) {
		
		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;
		
		// 표시할 페이지
		int currentPageNumber = pageNumber;
		
		// 메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		objTotalCount = dao.selectWeeklyOrderDetailCount(startDate, endDate, tableName);
		
		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			objList = dao.selectWeeklySalVOList(startDate, endDate, tableName, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}
		
		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}
	
	//hourlySal.jsp에 값 전달
	@Transactional
	public PageListView getHourlySalVOList(String startDate, String endDate, String tableName, int pageNumber, int countPerPage) {
		
		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;
		
		// 표시할 페이지
		int currentPageNumber = pageNumber;
		
		// 메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		objTotalCount = dao.selectHourlyOrderDetailCount(startDate, endDate, tableName);
		
		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			objList = dao.selectHourlySalVOList(startDate, endDate, tableName, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}
		
		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}
	
	
	
	

}
