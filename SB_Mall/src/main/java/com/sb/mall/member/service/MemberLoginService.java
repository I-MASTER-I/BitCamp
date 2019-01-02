package com.sb.mall.member.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberLoginService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private MemberDao Dao;

	public boolean login(String id, String pw, HttpSession session) throws SQLException {

		Dao = sqlSessionTemplate.getMapper(MemberDao.class);

		boolean result = false;

		MemberInfo memberInfo = Dao.selectById(id);

		// 비밀번호 비교
		if (memberInfo == null || !memberInfo.getUserPw().equals(pw)) {
				
		} else {

			// 로그인 처리 : 세션에 사용자 데이터 저장
			memberInfo.setUserPw("");		//db에서 받아온 패스워드를 세션에는 제외하고 저장

			session.setAttribute("memberInfo", memberInfo);

			//세션 시간
			session.setMaxInactiveInterval(60*60*2);
			
			result = true;
		}

		return result;

	}

}
