package com.bitcamp.op.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.jdbc.ConnectionProvider;
import com.bitcamp.op.member.dao.JdbcTemplateMemberDao;
import com.bitcamp.op.member.dao.MemberDao;
import com.bitcamp.op.member.dao.MemberDaoInterface;
import com.bitcamp.op.member.dao.MybatisMemberDao;
import com.bitcamp.op.member.model.MemberInfo;

public class MemberLoginService {
	
	//@Autowired
	//private MemberDao memberDao;
	
	//@Autowired
	//private JdbcTemplateMemberDao memberDao;
	
	//@Autowired
	//private MybatisMemberDao memberDao;
	

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberDaoInterface memberDao;
	
	

	
	public boolean login(String id, String pw, HttpSession session) throws SQLException {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		
		boolean result = false;
		
		
		MemberInfo memberInfo = memberDao.getMemberInfo(id);
		
		// 비밀번호 비교
		if(memberInfo != null && memberInfo.getPassword().equals(pw)) {
				
			System.out.println("로그인 처리");
			
				// 로그인 처리 : 세션에 사용자 데이터 저장
				memberInfo.setPassword("");
				
				
				
				session.setAttribute("loginInfo", memberInfo);
				
				result = true;			
			
		}
		
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
