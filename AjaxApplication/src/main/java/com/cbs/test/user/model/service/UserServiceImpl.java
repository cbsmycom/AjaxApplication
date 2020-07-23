package com.cbs.test.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbs.test.user.model.dao.UserDao;
import com.cbs.test.user.model.dto.UserDto;
import com.cbs.test.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;

	@Override
	public int insertUser(User user) {
		
		return userDao.insertUser(sqlSession, user);
	}

	@Override
	public int idCheck(String userId) {
		
		return userDao.idCheck(sqlSession, userId);
	}

	@Override
	public ArrayList<User> selectUserList() {
		
		return userDao.selectUserList(sqlSession);
	}

	@Override
	public User selectUserInfo(String userId) {
	
		return userDao.selectUserInfo(sqlSession, userId);
	}

	@Override
	public int modifyUserInfo(User user) {
		
		return userDao.modifyUserInfo(sqlSession, user);
	}

	@Override
	public User loginUser() {
		
		return userDao.loginUser(sqlSession);
	}

	@Override
	public int changePwd(User user) {
		
		return userDao.changePwd(sqlSession, user);
	}

	@Override
	public ArrayList<User> selectArea() {
		
		return userDao.selectArea(sqlSession);
	}

	@Override
	public int addUserPa(UserDto ud) {
	
		return userDao.addUserPa(sqlSession, ud);
	}

	@Override
	public ArrayList<UserDto> selectAreaList(String userId) {
		
		return userDao.selectAreaList(sqlSession, userId);
	}

	@Override
	public int deleteUserPa(UserDto ud) {
		
		return userDao.deleteUserPa(sqlSession, ud);
	}

}
