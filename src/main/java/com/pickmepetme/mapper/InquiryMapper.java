package com.pickmepetme.mapper;

import java.util.ArrayList;

import com.pickmepetme.domain.InquiryVO;

public interface InquiryMapper {

	// 1대1 문의 리스트 
	public ArrayList<InquiryVO> getList(InquiryVO inquiryvo);
	
	// 1대1 문의 작성
	public void registerInquiry(InquiryVO inquiryvo);
	
	// 1대1 문의 보기 
	public InquiryVO pageview(int no,String userid);
	
	 
}
