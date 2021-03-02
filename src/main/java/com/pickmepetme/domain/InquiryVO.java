package com.pickmepetme.domain;

import java.util.Date;

public class InquiryVO {
	private Long enquiry_no;  // 번호
	private String user_id; // 유저 아이디
	private String enquiry_title; // 문의명
	private String enquiry_contact; // 문의 내용
	private Date Enquiry_date; // 날짜
	
	public Long getEnquiry_no() {
		return enquiry_no;
	}
	public void setEnquiry_no(Long enquiry_no) {
		this.enquiry_no = enquiry_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getEnquiry_title() {
		return enquiry_title;
	}
	public void setEnquiry_title(String enquiry_title) {
		this.enquiry_title = enquiry_title;
	}
	
	
	public String getEnquiry_contact() {
		return enquiry_contact;
	}
	public void setEnquiry_contact(String enquiry_contact) {
		this.enquiry_contact = enquiry_contact;
	}
	public Date getEnquiry_date() {
		return Enquiry_date;
	}
	public void setEnquiry_date(Date enquiry_date) {
		Enquiry_date = enquiry_date;
	}
	
	
}
