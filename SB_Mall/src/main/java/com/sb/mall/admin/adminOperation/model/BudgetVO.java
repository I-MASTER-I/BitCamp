package com.sb.mall.admin.adminOperation.model;

public class BudgetVO {
	String nowYear;
	int year;
	long yearBudget;
	long Jan;
	long Feb;
	long Mar;
	long Apr;
	long May;
	long Jun;
	long Jul;
	long Aug;
	long Sep;
	long Oct;
	long Nov;
	long Dec;
	
	//월 버젯 합산
	public void sumYearBudget(){
		this.yearBudget = this.Jan + this.Feb + this.Mar + this.Apr + this.May + this.Jun + this.Jul + this.Aug + this.Sep + this.Oct + this.Nov + this.Dec;
	}
	
	@Override
	public String toString() {
		return "BudgetVO [nowYear=" + nowYear + ", year=" + year + ", yearBudget=" + yearBudget + ", Jan=" + Jan
				+ ", Feb=" + Feb + ", Mar=" + Mar + ", Apr=" + Apr + ", May=" + May + ", Jun=" + Jun + ", Jul=" + Jul
				+ ", Aug=" + Aug + ", Sep=" + Sep + ", Oct=" + Oct + ", Nov=" + Nov + ", Dec=" + Dec + "]";
	}
	public String getNowYear() {
		return nowYear;
	}
	public void setNowYear(String nowYear) {
		this.nowYear = nowYear;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public long getYearBudget() {
		return yearBudget;
	}
	public void setYearBudget(long yearBudget) {
		this.yearBudget = yearBudget;
	}
	public long getJan() {
		return Jan;
	}
	public void setJan(long jan) {
		Jan = jan;
	}
	public long getFeb() {
		return Feb;
	}
	public void setFeb(long feb) {
		Feb = feb;
	}
	public long getMar() {
		return Mar;
	}
	public void setMar(long mar) {
		Mar = mar;
	}
	public long getApr() {
		return Apr;
	}
	public void setApr(long apr) {
		Apr = apr;
	}
	public long getMay() {
		return May;
	}
	public void setMay(long may) {
		May = may;
	}
	public long getJun() {
		return Jun;
	}
	public void setJun(long jun) {
		Jun = jun;
	}
	public long getJul() {
		return Jul;
	}
	public void setJul(long jul) {
		Jul = jul;
	}
	public long getAug() {
		return Aug;
	}
	public void setAug(long aug) {
		Aug = aug;
	}
	public long getSep() {
		return Sep;
	}
	public void setSep(long sep) {
		Sep = sep;
	}
	public long getOct() {
		return Oct;
	}
	public void setOct(long oct) {
		Oct = oct;
	}
	public long getNov() {
		return Nov;
	}
	public void setNov(long nov) {
		Nov = nov;
	}
	public long getDec() {
		return Dec;
	}
	public void setDec(long dec) {
		Dec = dec;
	}

}
