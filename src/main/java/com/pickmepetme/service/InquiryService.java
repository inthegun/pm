package com.pickmepetme.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pickmepetme.domain.InquiryVO;

public interface InquiryService {

	// 1대1 문의 리스트 
	public ArrayList<InquiryVO> getList(InquiryVO inquiryvo,HttpSession session);

	// 1대1 문의 작성
	public void registerInquiry(InquiryVO inquiryvo,HttpSession session);

	// 1대1 문의 보기 
	 public InquiryVO pageview(int no,String userid);

}
