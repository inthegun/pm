package com.pickmepetme.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pickmepetme.domain.InquiryVO;
import com.pickmepetme.mapper.InquiryMapper;

@Service
public class InquiryServiceImpl implements InquiryService{

private static final Logger logger = LoggerFactory.getLogger(InquiryServiceImpl.class);
	
	@Autowired
	private InquiryMapper inquirymapper;
	
	// 1대1 문의 리스트 
	@Override
	public ArrayList<InquiryVO> getList(InquiryVO inquiryvo,HttpSession session) {
		logger.info("1대1문의 리스트 호출됨 ");
		inquiryvo.setUser_id((String) session.getAttribute("userId"));
		
		return inquirymapper.getList(inquiryvo);
	}


	@Override
	public void registerInquiry(InquiryVO inquiryvo,HttpSession session) {
		logger.info("1대1문의 작성 호출됨 ");
		
		inquiryvo.setUser_id((String)session.getAttribute("userId"));
		logger.info("inquiryvo.getUser_id 값 :"+inquiryvo.getUser_id());

		inquirymapper.registerInquiry(inquiryvo); 
		
	}


	// 1대1 문의 보기
	 @Override
	    public InquiryVO pageview(int no,String userid) {
	        logger.info("InquiryServiceImpl 글 보기 실행됨 ");

	        return inquirymapper.pageview(no,userid);
	    }
	}


