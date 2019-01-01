package member.model;

public class LoginInfo {

	private String userId;
	private String userName;
	private String userPhoto;

	/**
	 * @param userId
	 * @param userName
	 * @param userPhoto
	 */
	public LoginInfo(String userId, String userName, String userPhoto) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPhoto = userPhoto;
	}

	public LoginInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return "LoginInfo [userId=" + userId + ", userName=" + userName + ", userPhoto=" + userPhoto + "]";
	}

}
