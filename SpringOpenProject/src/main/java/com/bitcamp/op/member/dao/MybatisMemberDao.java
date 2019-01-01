package com.bitcamp.op.member.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.op.member.model.MemberInfo;

public class MybatisMemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String mapperPath = "com.bitcamp.op.mapper.mybatis.MemberMapper";

	public int insertMemberInfo(MemberInfo memberInfo) throws SQLException {
		return sqlSessionTemplate.update(mapperPath+".insertMember", memberInfo);
	}

	public MemberInfo getMemberInfo(String userid) {		
		return sqlSessionTemplate.selectOne(mapperPath+".selectById", userid);
	}
	
	
	
	
	
	
	
	
	

}
