package com.sb.mall.admin.adminOperation.model;

import java.util.Map;

public class TotalReportVO {
	// 토탈연버젯, 이번달까지연버젯, 토탈월버젯, 오늘까지월버젯
	private Map<String, Object> totalBudget;
	// 이번달까지 연매출
	private long yearAmount;
	// 일매출, 오늘의 주
	private Map<String, Object> dailySalesOrerCount;
	// 오늘의 방문수
	private int visitCount;
	// 오늘의 신규회원
	private int newMember;
	// 이번달 오늘까지 cost, 이번달 오늘까지매출, cost%
	private Map<String, Object> totalCostSales;
	// 이번달 오늘까지 인건비
	private int laborCost;
	// 이번달 오늘까지 유틸리티, 소모품
	private Map<String, Object> utilSupllie;
	// 이번달 오늘까지 임대료
	private int rent;

	// 맵 객체들에서 언바인딩해서 값 할당하는 변수들
	// totalBudget에서 언바인딩한다.
	private long yearBudgetTotal; // 연버젯 총합
	private long yearBudget; // 이번달까지 연버젯
	private long monthBudgetTotal; // 이번달 버젯 총합
	private long monthBudget; // 이번달 오늘까지 월버젯

	// dailySalesOrerCount 에서 언바인딩한다.
	private int dailySales; // 오늘의 매출
	private int orderCount; // 오늘의 주문수

	// totalCostSales에서 언바인딩한다.
	private int monthCost; // 이번달 오늘까지 코스트 총액
	private long monthAmount; // 이번달 오늘까지 매출
	private int monthCostRate; // 이번달 오늘까지 코스트 %
	private int monthAvg; // 이번달 오늘까지 일평균 매출

	// utilSupllie에서 언바인딩한다.
	private int utility; // 이번달 오늘까지 유틸리티 금액
	private int supplie; // 이번달 오늘까지 소모품 금액

	// 언바인딩 후 값 계산
	private int yearBudgetRate = 0; // 연버젯 % 이번달까지 매출 / 연버젯 * 100
	private int monthBudgetRate = 0; // 월버젯 % 이번달 오늘까지 매출 / 월버젯 * 100
	private int ppa = 0; // 오늘의 매출 / 주문수
	private int tce = 0; // 이번달 오늘까지 cost금액, 인건비, 유틸리티, 소모품비 합산금액
	private int tci = 0; // tce / 월매출 * 100
	private int tnc = 0; // 임대료 / 월매출 *100
	private int operatingCashflow = 0; // (매출 - (rent + TCE)) / 월매출 * 100
	private int laborCostRate = 100; // 이번달 오늘까지 인건비% - 인건비 / 이번달 오늘까지 매출 * 100
	private int utilityRate = 100; // 이번달 오늘까지 유틸리티 금액% - 유틸리티 / 이번달 오늘까지 매출 * 100
	private int supplieRate = 0; // 이번달 오늘까지 소모품 금액% - 소모품 / 이번달 오늘까지 매출 * 100

	
	
	
	// 언바인딩 및 계산하여 값 할당하는 메서드
	public void setTotalResultBinding() {
		// totalBudget에서 언바인딩한다.
		this.yearBudgetTotal = (long) this.totalBudget.get("yearBudgetTotal");
		this.yearBudget = (long) this.totalBudget.get("yearBudget");
		this.monthBudgetTotal = (long) this.totalBudget.get("monthBudgetTotal");
		this.monthBudget = (long)this.totalBudget.get("monthBudget");

		// dailySalesOrerCount 에서 언바인딩한다.
		this.dailySales = (int) this.dailySalesOrerCount.get("dailySales");
		this.orderCount = (int) this.dailySalesOrerCount.get("orderCount");

		// totalCostSales에서 언바인딩한다.
		this.monthCost = (int) this.totalCostSales.get("monthCost");
		this.monthAmount = (long) this.totalCostSales.get("monthAmount");
		this.monthCostRate = (int) this.totalCostSales.get("monthCostRate");
		this.monthAvg = (int) this.totalCostSales.get("monthAvg");
		
		// utilSupllie에서 언바인딩한다.
		this.utility = (int) this.utilSupllie.get("utility");
		this.supplie = (int) this.utilSupllie.get("supplie");


		// 언바인딩 후 값 계산
		if (this.yearBudget > 0) this.yearBudgetRate = (int) ((float)this.yearAmount / this.yearBudget * 100);
		if (this.monthBudget > 0) this.monthBudgetRate = (int) ((float)this.monthAmount / this.monthBudget * 100);
		if (this.orderCount > 0) this.ppa = (int) ((float)this.dailySales / this.orderCount);
		this.tce = this.monthCost + this.laborCost + this.supplie;
		this.operatingCashflow = (int) (this.monthAmount - (this.rent + this.tce));
		if (this.monthAmount > 0) {
			this.tci = (int) ((float)this.tce / this.monthAmount * 100);
			this.tnc = (int) ((float)this.rent / this.monthAmount * 100);
			this.laborCostRate = (int) ((float)this.laborCost / this.monthAmount * 100);
			this.utilityRate = (int) ((float)this.utility / this.monthAmount * 100);
			this.supplieRate = (int) ((float)this.supplie / this.monthAmount * 100);
		}
		
		
	}

	// 기본 변수들 게터 세터
	public Map<String, Object> getTotalBudget() {
		return totalBudget;
	}

	public void setTotalBudget(Map<String, Object> totalBudget) {
		this.totalBudget = totalBudget;
	}

	public long getYearAmount() {
		return yearAmount;
	}

	public void setYearAmount(long yearAmount) {
		this.yearAmount = yearAmount;
	}

	public Map<String, Object> getDailySalesOrerCount() {
		return dailySalesOrerCount;
	}

	public void setDailySalesOrerCount(Map<String, Object> dailySalesOrerCount) {
		this.dailySalesOrerCount = dailySalesOrerCount;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public int getNewMember() {
		return newMember;
	}

	public void setNewMember(int newMember) {
		this.newMember = newMember;
	}

	public Map<String, Object> getTotalCostSales() {
		return totalCostSales;
	}

	public void setTotalCostSales(Map<String, Object> totalCostSales) {
		this.totalCostSales = totalCostSales;
	}

	public int getLaborCost() {
		return laborCost;
	}

	public void setLaborCost(int laborCost) {
		this.laborCost = laborCost;
	}

	public Map<String, Object> getUtilSupllie() {
		return utilSupllie;
	}

	public void setUtilSupllie(Map<String, Object> utilSupllie) {
		this.utilSupllie = utilSupllie;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	@Override
	public String toString() {
		return "TotalReportVO [totalBudget=" + totalBudget + ", yearAmount=" + yearAmount + ", dailySalesOrerCount="
				+ dailySalesOrerCount + ", visitCount=" + visitCount + ", newMember=" + newMember + ", totalCostSales="
				+ totalCostSales + ", laborCost=" + laborCost + ", utilSupllie=" + utilSupllie + ", rent=" + rent
				+ ", yearBudgetTotal=" + yearBudgetTotal + ", yearBudget=" + yearBudget + ", monthBudgetTotal="
				+ monthBudgetTotal + ", monthBudget=" + monthBudget + ", dailySales=" + dailySales + ", orderCount="
				+ orderCount + ", monthCost=" + monthCost + ", monthAmount=" + monthAmount + ", monthCostRate="
				+ monthCostRate + ", monthAvg=" + monthAvg + ", utility=" + utility + ", supplie=" + supplie
				+ ", yearBudgetRate=" + yearBudgetRate + ", monthBudgetRate=" + monthBudgetRate + ", ppa=" + ppa
				+ ", tce=" + tce + ", tci=" + tci + ", tnc=" + tnc + ", operatingCashflow=" + operatingCashflow
				+ ", laborCostRate=" + laborCostRate + ", utilityRate=" + utilityRate + ", supplieRate=" + supplieRate
				+ "]";
	}

	public long getYearBudgetTotal() {
		return yearBudgetTotal;
	}

	public void setYearBudgetTotal(long yearBudgetTotal) {
		this.yearBudgetTotal = yearBudgetTotal;
	}

	public long getYearBudget() {
		return yearBudget;
	}

	public void setYearBudget(long yearBudget) {
		this.yearBudget = yearBudget;
	}

	public long getMonthBudgetTotal() {
		return monthBudgetTotal;
	}

	public void setMonthBudgetTotal(long monthBudgetTotal) {
		this.monthBudgetTotal = monthBudgetTotal;
	}

	public long getMonthBudget() {
		return monthBudget;
	}

	public void setMonthBudget(long monthBudget) {
		this.monthBudget = monthBudget;
	}

	public int getDailySales() {
		return dailySales;
	}

	public void setDailySales(int dailySales) {
		this.dailySales = dailySales;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getMonthCost() {
		return monthCost;
	}

	public void setMonthCost(int monthCost) {
		this.monthCost = monthCost;
	}

	public long getMonthAmount() {
		return monthAmount;
	}

	public void setMonthAmount(long monthAmount) {
		this.monthAmount = monthAmount;
	}

	public int getMonthCostRate() {
		return monthCostRate;
	}

	public void setMonthCostRate(int monthCostRate) {
		this.monthCostRate = monthCostRate;
	}

	public int getMonthAvg() {
		return monthAvg;
	}

	public void setMonthAvg(int monthAvg) {
		this.monthAvg = monthAvg;
	}

	public int getUtility() {
		return utility;
	}

	public void setUtility(int utility) {
		this.utility = utility;
	}

	public int getSupplie() {
		return supplie;
	}

	public void setSupplie(int supplie) {
		this.supplie = supplie;
	}

	public int getYearBudgetRate() {
		return yearBudgetRate;
	}

	public void setYearBudgetRate(int yearBudgetRate) {
		this.yearBudgetRate = yearBudgetRate;
	}

	public int getMonthBudgetRate() {
		return monthBudgetRate;
	}

	public void setMonthBudgetRate(int monthBudgetRate) {
		this.monthBudgetRate = monthBudgetRate;
	}

	public int getPpa() {
		return ppa;
	}

	public void setPpa(int ppa) {
		this.ppa = ppa;
	}

	public int getTce() {
		return tce;
	}

	public void setTce(int tce) {
		this.tce = tce;
	}

	public int getTci() {
		return tci;
	}

	public void setTci(int tci) {
		this.tci = tci;
	}

	public int getTnc() {
		return tnc;
	}

	public void setTnc(int tnc) {
		this.tnc = tnc;
	}

	public int getOperatingCashflow() {
		return operatingCashflow;
	}

	public void setOperatingCashflow(int operatingCashflow) {
		this.operatingCashflow = operatingCashflow;
	}

	public int getLaborCostRate() {
		return laborCostRate;
	}

	public void setLaborCostRate(int laborCostRate) {
		this.laborCostRate = laborCostRate;
	}

	public int getUtilityRate() {
		return utilityRate;
	}

	public void setUtilityRate(int utilityRate) {
		this.utilityRate = utilityRate;
	}

	public int getSupplieRate() {
		return supplieRate;
	}

	public void setSupplieRate(int supplieRate) {
		this.supplieRate = supplieRate;
	}
	
	
}
