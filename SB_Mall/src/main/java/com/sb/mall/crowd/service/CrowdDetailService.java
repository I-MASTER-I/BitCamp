package com.sb.mall.crowd.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdDao;
import com.sb.mall.crowd.dao.CrowdReplyDao;
import com.sb.mall.crowd.model.CrowdBoardRating;

@Component
public class CrowdDetailService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdDao crowdDao;
	private CrowdReplyDao crowdReplyDao;
	
	//디테일 페이지 게시판 정보
	public List<Map<String, Object>> getCrBoard(int crBoardSeq){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		return crowdDao.getDetailBoard(crBoardSeq);
	}
	
	public List<Map<String, Object>> getCrPhoto(String productNo){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
	
		return crowdDao.getDetailPhoto(productNo);
	}
	
	public List<Map<String, Object>> getCrGoods(int crProductSeq){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
	
		return crowdDao.getDetailGoods(crProductSeq);
	}
	
	public int getPhotoCount(String productNo) {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		return crowdDao.getPhotoCount(productNo);
	}
	
	public void setViewSeqUps(int crowdBoardSeq) {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		crowdDao.setViewSeqUp(crowdBoardSeq);
	}
	
	public CrowdBoardRating topRating(int crowdBoardSeq) {
		crowdReplyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		CrowdBoardRating boardRating = new CrowdBoardRating();
		int top =0;
		int mid=0;
		int bottom=0;
		Integer totalRating = crowdReplyDao.getTotalRating(crowdBoardSeq);
		
		if(totalRating!=0) {
			int count = crowdReplyDao.getReplyCount(crowdBoardSeq);
			boardRating.setCount(count);
			Double ratingCnt = (double) count;
			int midResult = (int) (totalRating/ratingCnt*10);

				
			top = midResult/10;
			boardRating.setTop(top);
			
			if(top!=5) {
				mid = midResult%10;
				boardRating.setMid(mid);
			}else {
				boardRating.setMid(0);
			}
			
			if(top<5) {
				int midCheck = 0;
				if(mid!=0) {
					midCheck=1;
				}
				
				bottom = 5-((int)(top)+midCheck);
				boardRating.setBottom(bottom);
			}else {
				boardRating.setBottom(0);
			}
			
		}else {
			boardRating.setTop(0);
			boardRating.setMid(0);
			boardRating.setBottom(0);
		}
		
		return boardRating;
	}
	
	
	public int getViewCount(int crowdBoardSeq) {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		return crowdDao.getViewSeq(crowdBoardSeq);
	}
	
	public String getDelivery(int crowdBoardSeq) throws ParseException {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		String delDate = crowdDao.getDelivery(crowdBoardSeq);
		String year = delDate.substring(0, 4);
		String month = delDate.substring(5, 7);
		String day = delDate.substring(8, 10);
		String dates = year+month+day;
		
		String days = "" ;
	     
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
	    Date nDate = dateFormat.parse(dates) ;
	    
	    Calendar cal = Calendar.getInstance() ;
	    cal.setTime(nDate);
	     
	    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
	     
	    switch(dayNum){
	        case 1:
	            days = "일";
	            break ;
	        case 2:
	            days = "월";
	            break ;
	        case 3:
	            days = "화";
	            break ;
	        case 4:
	            days = "수";
	            break ;
	        case 5:
	            days = "목";
	            break ;
	        case 6:
	            days = "금";
	            break ;
	        case 7:
	            days = "토";
	            break ;
	    }
	    
	    String result = year+"/"+month+"/"+day+"("+days+")";
	    System.out.println("result : "+result);
	    
		return result;
	}
	
	
}
