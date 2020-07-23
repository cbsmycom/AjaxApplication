package com.cbs.test.user.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cbs.test.user.model.dto.UserDto;
import com.cbs.test.user.model.vo.User;

@Repository
public class UserDao {

	public int insertUser(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.insert("userMapper.insertUser", user);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("userMapper.idCheck", userId);
	}

	public ArrayList<User> selectUserList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("userMapper.selectUserList");
	}

	public User selectUserInfo(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("userMapper.selectUserInfo", userId);
	}

	public int modifyUserInfo(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.update("userMapper.modifyUserInfo", user);
	}

	public User loginUser(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("userMapper.loginUser");
	}

	public int changePwd(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.update("userMapper.changePwd", user);
	}

	public ArrayList<User> selectArea(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("userMapper.selectArea");
	}

	public int addUserPa(SqlSessionTemplate sqlSession, UserDto ud) {
		
		int result = sqlSession.selectOne("userMapper.beforeCheck", ud);
		
		if(result > 0) {
			return 2; 
		}else {			
			return sqlSession.insert("userMapper.addUserPa", ud);
		}
	}

	public ArrayList<UserDto> selectAreaList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("userMapper.selectAreaList", userId);
	}

	public int deleteUserPa(SqlSessionTemplate sqlSession, UserDto ud) {
		
		return sqlSession.delete("userMapper.deleteUserPa", ud);
	}

}
