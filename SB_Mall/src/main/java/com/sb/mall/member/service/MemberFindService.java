package com.sb.mall.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberFindService {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplates;

	private MemberDao Dao;

	public List<MemberInfo> findId(HttpServletResponse response, String userName, String phone) throws Exception {

		Dao = sqlsessionTemplates.getMapper(MemberDao.class);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<MemberInfo> id = Dao.find_id(userName, phone);

		if (id == null) {

			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return null;

		} else {	
		
		
			
			return id;
		}

	}

	public String findPw(HttpServletResponse response, String userId, String userName) throws Exception {

		Dao = sqlsessionTemplates.getMapper(MemberDao.class);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String pw = Dao.find_pw(userId, userName);

		if (pw == null) {

			out.println("<script>");
			out.println("alert('아이디와 이름이 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();

			return null;

		} else  {
		
			out.println("<script>");
			out.println("alert('등록하신 이메일로 비밀번호가 전송되었습니다.');");
			out.println("</script>");
			out.flush();

			
			return pw;
		}

	}

}
