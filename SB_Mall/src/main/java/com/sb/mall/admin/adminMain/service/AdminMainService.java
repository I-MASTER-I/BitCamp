package com.sb.mall.admin.adminMain.service;

import java.time.LocalDate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminMain.dao.AdminMainDao;
import com.sb.mall.admin.adminMain.model.AdminMainVO;

@Repository
public class AdminMainService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminMainDao dao;
	
	@Transactional
	public AdminMainVO getAdminReport() {
		
		//날짜를 원하는 스트링 형태로 변환 
		LocalDate myDate = LocalDate.now();
		//월의 이름을 가져온다.
		String monthName = (myDate.minusMonths(0).getMonth().name()).substring(0, 3);
		
		AdminMainVO admin = new AdminMainVO();
		
		dao = sqlSessionTemplate.getMapper(AdminMainDao.class);
		
		//총 방문수
		admin.setVisitTotal(dao.visitCountTotal());
		//오늘의 방문수
		admin.setVisitToday(dao.visitCountDayPre(0));
		//어제의 방문수
		admin.setVisitPreday(dao.visitCountDayPre(1));
		
		//총 주문수
		admin.setOrderTotal(dao.orderCountTotal());
		//오늘의 주문수
		admin.setOrderToday(dao.orderDayCountPre(0));
		//어제의 주문수
		admin.setOrderPreday(dao.orderDayCountPre(1));
		
		//오늘의 매출
		admin.setSalesToday(dao.salesDayPre(0));
		//어제의 매출
		admin.setSalesPreday(dao.salesDayPre(1));
		//이번달 총 매출
		admin.setSalesThisMonth(dao.salesMonthPre(0));
		//지난달 총 매출
		admin.setSalesPreMonth(dao.salesMonthPre(1));
		//이번달 평균
		admin.setAverageThisMonth(dao.averageMonthPre(0));
		//주문상태
		admin.setOrderStatus(dao.orderStatus());
		//가입자
		admin.setJoinToday(dao.joinCountPre(0));
		admin.setJoinPreDay(dao.joinCountPre(1));
		//이번년도 월별 매출 및 평균
		admin.setSalesMonthThisYearAverage(dao.salesMonthThisYearAverage(0));
		//이번년도 월 평균 매출
		admin.setAverageMontYear(dao.averageMonthYear());
		//상품별 매출
		admin.setProductTop5(dao.productTop5());
		//전주 대비 일 평균 방문수
		admin.setVisitCountWeek(dao.visitCountWeek());
		
		
		//버젯 대비 월 매출 달성율 
		admin.setBudgetSales(dao.budgetSales(monthName, 0));

		return admin;

	}

}
