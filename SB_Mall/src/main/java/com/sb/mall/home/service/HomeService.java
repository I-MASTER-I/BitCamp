package com.sb.mall.home.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.home.dao.HomeDao;

@Component
public class HomeService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private HomeDao homeDao;
	
	public List<Map<String,Object>> getCrowdFunding() throws SQLException{
		
		homeDao = sqlSessionTemplate.getMapper(HomeDao.class);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		list = homeDao.getHomeCrowdFunding();
				
		for (Map<String, Object> map : list) {
			//남은 날짜 구하기
			Calendar today = Calendar.getInstance();
			Calendar Dday = Calendar.getInstance();
			Date theDay = (Date) map.get("salesDay");
			
			Dday.setTime(theDay);
			long l_Dday = Dday.getTimeInMillis()/(24*60*60*1000);
			long l_Tday = today.getTimeInMillis()/(24*60*60*1000);
			
			long result = l_Dday-l_Tday;
			
			map.put("leftDays", result);
			
			//달성률 구하기
			int target = (int) map.get("targetPrice");
			int odPrice = (int) map.get("totalOrderPrice"); 
			
			double target1 = target;
			double odPrice1 = odPrice;
			
			double achieve = ((odPrice1/target1)*100);
			int achieveT = (int) Math.round(achieve);
			
			map.put("achieve", achieveT);
		}
		
		return list;
	}
	
	
	public List<Map<String,Object>> getNewProduct() throws SQLException{
		
		homeDao = sqlSessionTemplate.getMapper(HomeDao.class);
		
		return homeDao.selectNewProduct();
	}
	
}
