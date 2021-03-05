package com.pickmepetme.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.UserVO;

public interface UserService  {
	//회원가입
	public void register(UserVO uservo);

	// 로그인
	public UserVO login(UserVO uservo);
	
	// 회원 정보 조회
	public UserVO readMember(String id);

	
	// 내가 쓴글 보기
	public ArrayList<ComunityVO> mywrite(ComunityVO comunityvo,HttpSession session);

	
}
