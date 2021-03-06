package com.pickmepetme.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.domain.UserVO;
import com.pickmepetme.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserMapper userMapper;
	
	
	// 회원가입
	@Override
	public void register(UserVO uservo) {
		logger.info("UserServiceImpl register를 실행합니다.");
		logger.info("받은데이터 : " + uservo);
		
		userMapper.register_user(uservo);
		
	}

	// 로그인
	@Override
	public UserVO login(UserVO uservo) {
		logger.info("UserServiceImpl login을 실행합니다");
		
		return userMapper.login(uservo);
	}

	// 회원 정보 조회 
	@Override
	public UserVO readMember(String id) {
		logger.info("UserServiceImpl readMember");
		UserVO userVO = null;
		
		try {
			userVO= userMapper.readMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}


	@Override
	public ArrayList<ComunityVO> mywrite(ComunityVO comunityvo,HttpSession session,Criteria cri) {
		// TODO Auto-generated method stub
		logger.info("내가 쓴글 보기 서비스impl");
		
		comunityvo.setUser_id((String)session.getAttribute("userId"));
		return userMapper.mywrite(cri);
		
	}
	
	@Override
	public void memberUpdate(UserVO vo){
		userMapper.memberUpdate(vo);		
	}

	//내가쓴글 총 갯수
	   @Override
	   public int mywriteCount(Criteria cri) {
	      logger.info("UserServiceImpl mywriteCount.........");
	      return userMapper.mywriteCount(cri);
	      
	   }
	
	
	

}
