package com.cbs.test.user.model.dto;

public class UserDto {
	
	private String userId;
	private String stateCode;
	private String stateName;
	private int power;
	
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDto(String userId, String stateCode, String stateName, int power) {
		super();
		this.userId = userId;
		this.stateCode = stateCode;
		this.stateName = stateName;
		this.power = power;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	@Override
	public String toString() {
		return "UserDto [userId=" + userId + ", stateCode=" + stateCode + ", stateName=" + stateName + ", power="
				+ power + "]";
	}
	
	
	
	

}
