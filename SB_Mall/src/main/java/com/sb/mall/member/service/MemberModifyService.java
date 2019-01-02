package com.sb.mall.member.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberModifyService {

	@Autowired
	SqlSessionTemplate sessionTemplate;

	@Autowired
	private AES256Util aes256Util;

	private MemberDao memberDao;

	public MemberInfo getMember(String id, String pw) throws Exception{
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		MemberInfo memberInfo = new MemberInfo();
		try {
			String enPw = aes256Util.encrypt(pw);
			String findPw = memberDao.checkPw(id);
			if (enPw.equals(findPw)) {
				memberInfo = memberDao.selectById(id);
			}else {
				throw new Exception("비밀번호 다름");
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
		}
		return memberInfo;
	}// end of Method(memberModify)

	public String modifyMember(MemberInfo memberInfo) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		memberInfo.setUserPw(aes256Util.encrypt(memberInfo.getUserPw()));
		
		String result="회원정보 수정 중 오류가 발생했습니다./n 문제가 계속 발생되면 고객센터로 문의해주세요.";
		
		int updateCheck = memberDao.updateMember(memberInfo);
		if(updateCheck==1) {
			result = "회원정보 수정을 완료하였습니다.";
		}
		
		return result;
	}// end of Method(memberModify_end)
	
	public void modifyMemberPw(MemberInfo memberInfo) {
//		String pw = memberInfo.getUserPw();
		memberDao = sessionTemplate.getMapper(MemberDao.class);
//		if(pw!=null) {
//			try {
//				memberInfo.setUserPw(aes256Util.encrypt(pw));
				memberDao.updatePw(memberInfo);
//			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
//				e.printStackTrace();
//			}
//		}
	}// end of Method(memberModify_end)

}
