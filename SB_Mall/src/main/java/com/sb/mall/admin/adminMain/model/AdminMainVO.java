package com.sb.mall.admin.adminMain.model;

import java.util.List;
import java.util.Map;

public class AdminMainVO {
	//방문자수
	private int visitTotal; //총 방문자 수
	private int visitToday; //오늘의 방문자수
	private int visitPreday; //어제의 방문자수
	private int orderTotal;
	private int orderToday; //오늘의 주문수
	private int orderPreday; //어제의 주문수
	//매출
	private Long salesToday; //오늘의 매출
	private Long salesPreday; //어제의 매출
	private Long salesThisMonth; //이번달 총 매출
	private Long salesPreMonth;
	private Long averageThisMonth; //이번달 평균
	//주문상태
	private List<Map<String, Integer>> orderStatus; //주문 상태 조회
	//가입자
	private int joinToday; //오늘의 가입자
	private int joinPreDay; //어제의 가입자
	//이번년도 월별 매출
	private List<Map<String, Object>> salesMonthThisYearAverage;
	//이번년도 월 평균 매출
	private Long averageMontYear;
	//상품별 매출
	private List<Map<String, Object>> productTop5;
	//전주 대비 일 평균 방문수
	private List<Map<String, Object>> visitCountWeek;
	//	버젯 대비 월 매출 달성율 
	private Map<String, Object> budgetSales;
	
	public int getVisitTotal() {
		return visitTotal;
	}
	public void setVisitTotal(int visitTotal) {
		this.visitTotal = visitTotal;
	}
	public int getVisitToday() {
		return visitToday;
	}
	public void setVisitToday(int visitToday) {
		this.visitToday = visitToday;
	}
	public int getVisitPreday() {
		return visitPreday;
	}
	public void setVisitPreday(int visitPreday) {
		this.visitPreday = visitPreday;
	}
	public int getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}
	public int getOrderToday() {
		return orderToday;
	}
	public void setOrderToday(int orderToday) {
		this.orderToday = orderToday;
	}
	public int getOrderPreday() {
		return orderPreday;
	}
	public void setOrderPreday(int orderPreday) {
		this.orderPreday = orderPreday;
	}
	public Long getSalesToday() {
		return salesToday;
	}
	public void setSalesToday(Long salesToday) {
		this.salesToday = salesToday;
	}
	public Long getSalesPreday() {
		return salesPreday;
	}
	public void setSalesPreday(Long salesPreday) {
		this.salesPreday = salesPreday;
	}
	public Long getSalesThisMonth() {
		return salesThisMonth;
	}
	public void setSalesThisMonth(Long salesThisMonth) {
		this.salesThisMonth = salesThisMonth;
	}
	public Long getSalesPreMonth() {
		return salesPreMonth;
	}
	public void setSalesPreMonth(Long salesPreMonth) {
		this.salesPreMonth = salesPreMonth;
	}
	public Long getAverageThisMonth() {
		return averageThisMonth;
	}
	public void setAverageThisMonth(Long averageThisMonth) {
		this.averageThisMonth = averageThisMonth;
	}
	public List<Map<String, Integer>> getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(List<Map<String, Integer>> orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getJoinToday() {
		return joinToday;
	}
	public void setJoinToday(int joinToday) {
		this.joinToday = joinToday;
	}
	public int getJoinPreDay() {
		return joinPreDay;
	}
	public void setJoinPreDay(int joinPreDay) {
		this.joinPreDay = joinPreDay;
	}
	public List<Map<String, Object>> getSalesMonthThisYearAverage() {
		return salesMonthThisYearAverage;
	}
	public void setSalesMonthThisYearAverage(List<Map<String, Object>> salesMonthThisYear) {
		this.salesMonthThisYearAverage = salesMonthThisYear;
	}
	public Long getAverageMontYear() {
		return averageMontYear;
	}
	public void setAverageMontYear(Long averageMontYear) {
		this.averageMontYear = averageMontYear;
	}
	public List<Map<String, Object>> getProductTop5() {
		return productTop5;
	}
	public void setProductTop5(List<Map<String, Object>> productTop5) {
		this.productTop5 = productTop5;
	}
	public List<Map<String, Object>> getVisitCountWeek() {
		return visitCountWeek;
	}
	public void setVisitCountWeek(List<Map<String, Object>> visitCountWeek) {
		this.visitCountWeek = visitCountWeek;
	}
	public Map<String, Object> getBudgetSales() {
		return budgetSales;
	}
	public void setBudgetSales(Map<String, Object> budgetSales) {
		this.budgetSales = budgetSales;
	}
	@Override
	public String toString() {
		return "AdminMainVO [visitTotal=" + visitTotal + ", visitToday=" + visitToday + ", visitPreday=" + visitPreday
				+ ", orderTotal=" + orderTotal + ", orderToday=" + orderToday + ", orderPreday=" + orderPreday
				+ ", salesToday=" + salesToday + ", salesPreday=" + salesPreday + ", salesThisMonth=" + salesThisMonth
				+ ", salesPreMonth=" + salesPreMonth + ", averageThisMonth=" + averageThisMonth + ", orderStatus="
				+ orderStatus + ", joinToday=" + joinToday + ", joinPreDay=" + joinPreDay
				+ ", salesMonthThisYearAverage=" + salesMonthThisYearAverage + ", averageMontYear=" + averageMontYear
				+ ", productTop5=" + productTop5 + ", visitCountWeek=" + visitCountWeek + ", budgetSales=" + budgetSales
				+ "]";
	}
	
	
	
	
	
	
	
}
