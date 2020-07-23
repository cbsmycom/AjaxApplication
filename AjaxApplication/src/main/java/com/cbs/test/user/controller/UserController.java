package com.cbs.test.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbs.test.user.model.dto.UserDto;
import com.cbs.test.user.model.service.UserService;
import com.cbs.test.user.model.vo.User;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	/**
	 * main 화면및 session에 admin 정보 담는 메소드
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping("main.do")
	public ModelAndView goMain(ModelAndView mv, HttpSession session) {
		
		if(session.getAttribute("loginUser") != null) {
			session.removeAttribute("loginUser");
		}
		
		User loginUser = userService.loginUser();
		
		session.setAttribute("loginUser", loginUser);
		
		ArrayList<User> list = userService.selectUserList();
		mv.addObject("list",list);		
		mv.setViewName("main");
		
		return mv;
	}
	
	
	/**
	 * user등록 메소드
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insertUser.us", produces="application/json; charset=utf-8")
	public String insertUser(User user) {
		
		String data = "";
		
		int result = userService.insertUser(user);
		
		if(result>0) {
			data = "1";
		}else {
			data = "2";
		}
		return data;
	
		}
	
	/**
	 * ID check 메소드
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="idCheck.us", produces="application/json; charset=utf-8")
	public String idCheck(String userId) {
		
		String data = "";
		int result = userService.idCheck(userId);
			
			if(result == 0) {
				data = "1";
			}else {
				data = "2";
			}
			return data;
		}
	
	/**
	 * user 목록 불러오는 메소드
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectUserList.us", produces="application/json; charset=utf-8")
	public String selectUserlist() {
		
		ArrayList<User> list = userService.selectUserList();
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	/**
	 * 선택된 user 정보 불러오는 메소드
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectUserInfo.us", produces="application/json; charset=utf-8")
	public String selectUserInfo(String userId) {

		User user = userService.selectUserInfo(userId);

		Gson gson = new Gson();
		
		return gson.toJson(user);

	}
	
	/**
	 * user정보 수정 메소드
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="modifyUserInfo.us", produces="application/json; charset=utf-8")
	public String modifyUserInfo(User user) {
		
		String data = "";
		
		int result = userService.modifyUserInfo(user);
		
		if(result>0) {
			data = "1";
		}else {
			data = "2";
		}
		
		return data;
	}
	
	/**
	 * 비밀번호 변경 메소드
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="changePwd.us", produces="application/json; charset=utf-8")
	public String changePwd(User user) {
		
		String data = "";
		
		int result = userService.changePwd(user);
		
		if(result>0) {
			data = "1";
		}else {
			data = "2";
		}
		return data;
	}
	
	/**
	 * 관리소 목록 불러오는 메소드
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectArea.us", produces="application/json; charset=utf-8")
	public String selectArea() {
		
		ArrayList<User> list = userService.selectArea();
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	/**
	 * 관할 권한 등록 메소드
	 * @param ud
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addUserPa.us", produces="application/json; charset=utf-8")
	public String addUserPa(UserDto ud) {
		
		String data = "";
		
		int result = userService.addUserPa(ud);
		
		if(result == 1) {
			data = "1";
		}else {
			data = "2";
		}
		return data;
	}
	
	/**
	 * user별 권한 등록된 지역 불러오는 메소드
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectAreaList.us", produces="application/json; charset=utf-8")
	public String selectAreaList(String userId) {
		
		ArrayList<UserDto> list = userService.selectAreaList(userId);
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	/**
	 * user별 권한등록된 지역 삭제 메소드
	 * @param ud
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteUserPa.us", produces="application/json; charset=utf-8")
	public String deleteUserPa(UserDto ud) {
		
		String data = "";
		int result = userService.deleteUserPa(ud);
		
		if(result>0) {
			data = "1";
		}else {
			data = "2";
		}
		
		return data;
	}
	

}


