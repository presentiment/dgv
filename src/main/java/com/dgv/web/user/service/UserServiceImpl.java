package com.dgv.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.user.dao.UserDAO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	// 회원가입처리
	@Override
	public int register(UserVO userVO) {
		return userDAO.register(userVO);
	}

	// 로그인처리
	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}

	// ID 중복 체크
	@Override
	public int checkId(String id) {
		return userDAO.checkId(id);
	}

	// 마이페이지 상단 페이지
	@Override
	public UserVO MyUserList(String id) {
		return userDAO.MyUserList(id);
	}

	// 회원 개인정보변경 불러오기 부분
	@Override
	public UserVO MyUserData(String id) {
		return userDAO.MyUserData(id);
	}

	// 회원정보 수정
	@Override
	public int updateUser(UserVO userVO) {
		return userDAO.updateUser(userVO);
	}

	// 회원 탈퇴
	@Override
	public int deleteUser(UserVO userVO) {
		return userDAO.deleteUser(userVO);
	}

}