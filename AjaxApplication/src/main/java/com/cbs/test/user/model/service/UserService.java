package com.cbs.test.user.model.service;

import java.util.ArrayList;

import com.cbs.test.user.model.dto.UserDto;
import com.cbs.test.user.model.vo.User;

public interface UserService {

	int insertUser(User user);

	int idCheck(String userId);

	ArrayList<User> selectUserList();

	User selectUserInfo(String userId);

	int modifyUserInfo(User user);

	User loginUser();

	int changePwd(User user);

	ArrayList<User> selectArea();

	int addUserPa(UserDto ud);

	ArrayList<UserDto> selectAreaList(String userId);

	int deleteUserPa(UserDto ud);

}
