package com.sb.mall.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;

@Repository
public class MemberDeleteService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private MemberDao memberDao;
	
	public int memberDelete(String userId) {
		
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		
		int deleteResult = memberDao.delete(userId);
		
		return deleteResult;
	}

}
