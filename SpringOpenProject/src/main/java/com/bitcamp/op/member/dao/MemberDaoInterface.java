package com.bitcamp.op.member.dao;

import com.bitcamp.op.member.model.MemberInfo;

public interface MemberDaoInterface {
	
	public MemberInfo getMemberInfo(String id);
	public int insertMemberInfo(MemberInfo memberInfo);

}
