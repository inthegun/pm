package com.pickmepetme.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pickmepetme.domain.UserVO;
import com.pickmepetme.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void register(UserVO uservo) {
		logger.info("UserServiceImpl register를 실행합니다.");
		logger.info("받은데이터 : " + uservo);
		
		userMapper.register_user(uservo);
		
	}

	@Override
	public UserVO login(UserVO uservo) {
		logger.info("UserServiceImpl login을 실행합니다");
		
		return userMapper.login(uservo);
	}

}
