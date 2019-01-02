package com.sb.mall.admin.adminStatistics.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.admin.adminStatistics.model.MemberStatVO;
import com.sb.mall.admin.adminStatistics.model.VisitStatVO;

public interface AdminStatisticsDao {
	
	// 방문 통계를 불러온다.
	public VisitStatVO getVisitStatVO(Object nowDate);
	
	// 최근 15일 통계를 불러온다.
	public List<Map<String, Object>> getFifthChart(Object nowDate);
	
	// 시간대별 통게를 불러온다..
	public List<Map<String, Object>> getHourlyChart(Object nowDate);
	
	// 월별 통계를 불러온다.
	public List<Map<String, Object>> getMonthlyChart(Object nowDate);
	
	// 가입자 통계를 불러온다.
	public MemberStatVO memberStatVO(Object nowDate);
	
	// total 회원 통게를 불러온다.
	public List<Map<String, Object>> ageTotal(Object nowDate); //연령별 통계
	public Map<String, Object> genderTotal(Object nowDate); //성별 통계
	public List<Map<String, Object>> countryTotal(Object nowDate); //지역별 통계
	
	// 최근 15일 회원 통계를 불러온다.
	public List<Map<String, Object>> fifthJoin(Object nowDate);
	
	// 월별 회원 통계를 불러온다.
	public List<Map<String, Object>> monthlyJoin(Object nowDate);


}
