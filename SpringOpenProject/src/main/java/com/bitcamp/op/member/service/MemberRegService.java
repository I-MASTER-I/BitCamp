package com.bitcamp.op.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.op.member.dao.MemberDaoInterface;
import com.bitcamp.op.member.model.MemberInfo;

public class MemberRegService {
	
	//@Autowired
	//private MemberDao memberDao;
	
	//@Autowired
	//private JdbcTemplateMemberDao memberDao;
	
	//@Autowired
	//private MybatisMemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberDaoInterface memberDao;
	
		
	
	@Transactional
	public int memberReg(MemberInfo memberInfo, HttpServletRequest request) throws SQLException, IllegalStateException, IOException {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		
		
		//conn = ConnectionProvider.getConnection();
		int resultCnt = 0 ;
		
		// 물리적 저장 경로
		String uploadUri = "/uploadfile/userphoto";
		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		
		
		// DB 저장용 파일 이름, 물리적 저장할때의 이름
		String imgName = "";
		
		if(!memberInfo.getPhotoFile().isEmpty()) {
			
			imgName = memberInfo.getUserId()+"_"+memberInfo.getPhotoFile().getOriginalFilename();
			
			// 물리적 저장
			memberInfo.getPhotoFile().transferTo(new File(dir, imgName));
					
			
			// DB 에 저장할 이름 SET
			memberInfo.setUserPhoto(imgName);
			
		}
		
		
		
		//try {	
			//conn.setAutoCommit(false);
			
			resultCnt = memberDao.insertMemberInfo(memberInfo);
			
			//memberDao.insertMemberInfo(memberInfo);
			
			System.out.println("service - 신규 회원 의 IDX 값 : " + memberInfo.getIdx());
			
			
			
			//conn.commit();
		//} catch (Exception e) {
		//	JdbcUtil.rollback(null);
		//	throw e;
		//} finally {
		//	conn.setAutoCommit(false);
		//	JdbcUtil.close(conn);
		//}
		
		return resultCnt;
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
