package com.sb.mall.member.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberInfo {
	private int userSeq;
	private String userId;
	private String userPw;
	private String userName;
	private String address1;
	private String address2;
	private int zipCode;
	private String phone;
	private Date regDate;
	private int gradeNum;
	private int point;
	private int userAmount;
	private int birth;
	private String gender;
	
	

	@Override
	public String toString() {
		return "MemberInfo [userSeq=" + userSeq + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", address1=" + address1 + ", address2=" + address2 + ", zipCode=" + zipCode + ", phone=" + phone
				+ ", regDate=" + regDate + ", gradeNum=" + gradeNum + ", point=" + point + ", userAmount=" + userAmount
				+ ", birth=" + birth + ", gender=" + gender + "]";
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getRegID() {
		return birth;
	}

	public void setRegID(int regID) {
		this.birth = regID;
	}

	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getGradeNum() {
		return gradeNum;
	}
	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUserAmount() {
		return userAmount;
	}
	public void setUserAmount(int userAmount) {
		this.userAmount = userAmount;
	}
	public String getRegDate() {
		return new SimpleDateFormat("yyyy/MM/dd").format(regDate);
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
