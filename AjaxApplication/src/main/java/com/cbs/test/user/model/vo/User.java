package com.cbs.test.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {

	private String userId;
	private String userName;
	private String phone;
	private String password;
	private String email;
	private int power;
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public User(String userId, String userName, String phone, String password, String email, int power) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.password = password;
		this.email = email;
		this.power = power;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", phone=" + phone + ", password=" + password
				+ ", email=" + email + ", power=" + power + "]";
	}
	
	
}
