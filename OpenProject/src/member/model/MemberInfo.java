package member.model;

public class MemberInfo {

	private int idx;
	private String userId;
	private String password;
	private String userName;
	private String userPhoto;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public boolean checkPassword(String pw) {
		return password.equals(pw);
	}

	public LoginInfo toLoginInfo() {
		return new LoginInfo(userId, userName, userPhoto);
	}

	@Override
	public String toString() {
		return "MemberInfo [userId=" + userId + ", password=" + password + ", userName=" + userName + ", userPhoto="
				+ userPhoto + "]";
	}

}
