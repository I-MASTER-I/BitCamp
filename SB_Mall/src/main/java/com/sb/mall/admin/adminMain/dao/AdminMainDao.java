package com.sb.mall.admin.adminMain.dao;

import java.util.List;
import java.util.Map;

public interface AdminMainDao {
	//특정일 값 조회는 매개변수 obj에 date 형식 또는 Long 또는 TimeStamp 를 넣으면 된다.
	//오늘이나 며칠 전 값을 조회하고 싶으면 메서드 이름 뒤에 Pre가 붙은 메서드에 원하는 숫자를 넣는다. 0을 넣으면 오늘 , -1을 넣으면 하루전 이런식
	
	//방문수
	public Integer visitCountTotal();
	public Integer visitCountDay(Object obj);
	public Integer visitCountDayPre(int interval);
	//주문수
	public Integer orderCountTotal();
	public Integer orderDayCount(Object obj);
	public Integer orderDayCountPre(int interval);
	//매출
	public Long salesDay(Object obj);
	public Long salesDayPre(int interval);
	public Long salesMonth(Object obj);
	public Long salesMonthPre(int interval);
	public Long salesYear(Object obj);
	public Long salesYearPre(int interval);
	//특정년도 월별 매출
	public List<Map<String, Object>> salesMonthYear(Object obj);
	//이번년도 월별 매출
	public List<Map<String, Object>> salesMonthYearPre(int interval);
	//이번년도 월별 매출 및 월 평균
	public List<Map<String, Object>> salesMonthThisYearAverage(int interval);
	public Long averageMonth(Object obj);
	public Long averageThisMonth();
	public Long averageMonthPre(int interval);
	//주문상태
	public List<Map<String, Integer>> orderStatus();
	//가입자
	public Integer joinCount(Object obj);
	public Integer joinCountPre(int interval);
	//상품별 매출 Top 5
	public List<Map<String, Object>> productTop5();
	//이번년도 월평균 매출
	public Long averageMonthYear();
	//이번주 전주 평균 방문자수 비교
	public List<Map<String, Object>> visitCountWeek();
	//버젯 대비 월 매출 달성율
	public Map<String, Object> budgetSales(Object monthName, int interval);
	
	
}
