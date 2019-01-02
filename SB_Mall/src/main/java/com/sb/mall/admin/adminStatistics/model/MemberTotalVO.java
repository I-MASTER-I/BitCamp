package com.sb.mall.admin.adminStatistics.model;

import java.util.List;
import java.util.Map;

public class MemberTotalVO {
	
	private List<Map<String, Object>> ageTotal;

	private Map<String, Object> genderTotal;
	
	private List<Map<String, Object>> countryTotal;

	
	public List<Map<String, Object>> getAgeTotal() {
		return ageTotal;
	}

	public void setAgeTotal(List<Map<String, Object>> ageTotal) {
		this.ageTotal = ageTotal;
	}

	public Map<String, Object> getGenderTotal() {
		return genderTotal;
	}

	public void setGenderTotal(Map<String, Object> genderTotal) {
		this.genderTotal = genderTotal;
	}

	public List<Map<String, Object>> getCountryTotal() {
		return countryTotal;
	}

	public void setCountryTotal(List<Map<String, Object>> countryTotal) {
		this.countryTotal = countryTotal;
	}

	@Override
	public String toString() {
		return "MemberTotalVO [ageTotal=" + ageTotal + ", genderTotal=" + genderTotal + ", countryTotal=" + countryTotal
				+ "]";
	}
	
	
	
	
	
}
