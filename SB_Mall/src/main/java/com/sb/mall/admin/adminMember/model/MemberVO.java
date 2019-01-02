package com.sb.mall.admin.adminMember.model;

public class MemberVO {
	private int userSeq;
	private String userId;
	private String userPw;
	private String userName;
	private String address;
	private String zipCode;
	private String phone;
	private String regDate;
	private int gradeNum;
	private int point;
	private long userAmount;
	private String birth;
	private String gender;
	private int laborCost;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public long getUserAmount() {
		return userAmount;
	}
	public void setUserAmount(long userAmount) {
		this.userAmount = userAmount;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getLaborCost() {
		return laborCost;
	}
	public void setLaborCost(int laborCost) {
		this.laborCost = laborCost;
	}
	@Override
	public String toString() {
		return "MemberVO [userSeq=" + userSeq + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", address=" + address + ", zipCode=" + zipCode + ", phone=" + phone + ", regDate=" + regDate
				+ ", gradeNum=" + gradeNum + ", point=" + point + ", userAmount=" + userAmount + ", birth=" + birth
				+ ", gender=" + gender + ", laborCost=" + laborCost + "]";
	}
	
	
}
