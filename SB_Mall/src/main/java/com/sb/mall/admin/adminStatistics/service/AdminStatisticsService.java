package com.sb.mall.admin.adminStatistics.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminStatistics.dao.AdminStatisticsDao;
import com.sb.mall.admin.adminStatistics.model.MemberStatVO;
import com.sb.mall.admin.adminStatistics.model.MemberTotalVO;
import com.sb.mall.admin.adminStatistics.model.VisitStatVO;

@Repository
public class AdminStatisticsService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminStatisticsDao dao;
	
	
	//loadVisitStatReport.jsp에서 사용할 데이터 수집
	@Transactional
	public VisitStatVO getVisitStatVO(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		VisitStatVO visitStatVO = new VisitStatVO();
		
		//dao의 메서드 실행하여
		visitStatVO = dao.getVisitStatVO(nowDate);

		return visitStatVO;
	}
	
	//최근 15일 방문수 조회
	@Transactional
	public List<Map<String, Object>> fifthChart(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		List<Map<String, Object>> fifthChart = new ArrayList<Map<String,Object>>();
		
		fifthChart = dao.getFifthChart(nowDate);
		
		return fifthChart;
	}
	
	//시간대별 방문수 조회
	@Transactional
	public List<Map<String, Object>> hourlyChart(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		List<Map<String, Object>> hourlyChart = new ArrayList<Map<String,Object>>();
		
		hourlyChart = dao.getHourlyChart(nowDate);
		
		return hourlyChart;
	}
	
	//월별 방문수 조회
	@Transactional
	public List<Map<String, Object>> monthlyChart(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		List<Map<String, Object>> monthlyChart = new ArrayList<Map<String,Object>>();
		
		monthlyChart = dao.getMonthlyChart(nowDate);
		
		return monthlyChart;
	}
	
	//loadMemberStatReport.jsp에서 사용할 데이터 수집
	@Transactional
	public MemberStatVO memberStatVO(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		MemberStatVO memberStatVO = new MemberStatVO();
		
		//dao의 메서드 실행하여
		memberStatVO = dao.memberStatVO(nowDate);

		return memberStatVO;
	}
	
	
	//총 가입자 현황
	@Transactional
	public MemberTotalVO memberTotal(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		//total 회원 통게를 불러온다.
		MemberTotalVO memberTotalVo = new MemberTotalVO();
		
		//연령별 통계
		memberTotalVo.setAgeTotal(dao.ageTotal(nowDate));
		//성별 통계
		memberTotalVo.setGenderTotal(dao.genderTotal(nowDate));
		//지역별 통계
		memberTotalVo.setCountryTotal(dao.countryTotal(nowDate));
		
		return memberTotalVo;
	}
	
	//최근 15일 가입자 조회
	@Transactional
	public List<Map<String, Object>> fifthJoin(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		List<Map<String, Object>> fifthJoin = new ArrayList<Map<String,Object>>();
		
		fifthJoin = dao.fifthJoin(nowDate);
		
		return fifthJoin;
	}
	
	//월별 가입자 조회
	@Transactional
	public List<Map<String, Object>> monthlyJoin(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		List<Map<String, Object>> monthlyJoin = new ArrayList<Map<String,Object>>();
		
		monthlyJoin = dao.monthlyJoin(nowDate);
		
		return monthlyJoin;
	}
	
}
	
	