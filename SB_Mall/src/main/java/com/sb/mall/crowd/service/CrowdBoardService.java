package com.sb.mall.crowd.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.crowd.dao.CrowdDao;

@Repository
public class CrowdBoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdDao crowdDao;
	
	public List<Map<String, Object>> getCrowdBoard(int crowdPageCount,int pageShowCnt){
		crowdDao=sqlSessionTemplate.getMapper(CrowdDao.class);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		int startBoard = (crowdPageCount-1)*pageShowCnt;
		System.out.println("startBoard : "+startBoard+", pageShowCnt : "+pageShowCnt);
		
		list = crowdDao.selectCrowdBoard(startBoard, pageShowCnt);
		
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
	public int getBoardPageCnt(int viewAmount) {
		crowdDao=sqlSessionTemplate.getMapper(CrowdDao.class);
		int totalPage = crowdDao.getBoardPageCnt(); 
		System.out.println("totalPage : "+totalPage);
		int paging=1;
		
		if(totalPage<viewAmount) {
			paging=1;
		}else {
			paging = totalPage/viewAmount;
			if(totalPage%viewAmount!=0) {
				paging++;
			}
		}
		
		return paging;
	}
	
}
