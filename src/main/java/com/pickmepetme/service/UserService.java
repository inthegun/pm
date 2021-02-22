package com.pickmepetme.service;

import com.pickmepetme.domain.UserVO;

public interface UserService  {
	//회원가입
	public void register(UserVO uservo);

	// 로그인
	public UserVO login(UserVO uservo);
}
