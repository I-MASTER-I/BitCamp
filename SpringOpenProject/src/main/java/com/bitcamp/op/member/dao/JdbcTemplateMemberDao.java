package com.bitcamp.op.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.bitcamp.op.member.model.MemberInfo;

public class JdbcTemplateMemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insertMemberInfo(MemberInfo memberInfo) throws SQLException {
		
		int resultCnt = 0;
		
		String insert_sql = "insert into "
				+ " member (userid, password, username, userphoto ) "
				+ " values(?, ?, ?, ?)";
		
		KeyHolder keyholder = new GeneratedKeyHolder();
		
		resultCnt = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				
				PreparedStatement pstmt = con.prepareStatement(insert_sql, new String[] {"idx"});
				pstmt.setString(1, memberInfo.getUserId());
				pstmt.setString(2, memberInfo.getPassword());
				pstmt.setString(3, memberInfo.getUserName());
				pstmt.setString(4, memberInfo.getUserPhoto());			
				
				return pstmt;
			}
		}, keyholder);
		
		
		Number keyValue = keyholder.getKey();
		
		memberInfo.setIdx(keyValue.intValue());
		
		/*resultCnt = jdbcTemplate.update(insert_sql, 
									memberInfo.getUserId(),
									memberInfo.getPassword(),
									memberInfo.getUserName(),
									memberInfo.getUserPhoto());
		*/
		return resultCnt;
		
		
		
		
	}

	public MemberInfo getMemberInfo(String id) {

		String sql = "select * from member where userid=?";

		List<MemberInfo> result = jdbcTemplate.query(sql, new RowMapper<MemberInfo>() {

			@Override
			public MemberInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberInfo memberInfo = new MemberInfo();
				memberInfo.setUserId(rs.getString("userid"));
				memberInfo.setPassword(rs.getString("password"));
				memberInfo.setUserName(rs.getString("username"));
				memberInfo.setUserPhoto(rs.getString("userphoto"));

				return memberInfo;
			}

		}, id);

		return result.isEmpty() ? null : result.get(0);
	}

}
