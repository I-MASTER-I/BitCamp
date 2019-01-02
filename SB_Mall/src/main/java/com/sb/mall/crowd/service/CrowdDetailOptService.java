package com.sb.mall.crowd.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdDao;

@Component
public class CrowdDetailOptService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdDao crowdDao;
	
	public List<Map<String, Object>> getOpt1(String goodsNo){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		list = crowdDao.getOpt1(goodsNo);
		
		return list;
	}
	
	public List<Map<String, Object>> getOpt2(String goodsNo, String opt1Name){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		list = crowdDao.getOpt2(goodsNo,opt1Name);
		System.out.println("opt2List : "+list);
		
		return list;
	}
}
