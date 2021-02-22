package com.pickmepetme.domain;

import java.util.Date;

public class EnquiryVO {
	private Long enquiry_no; // 
	private String user_id; // 
	private String enquiry_title; // 
	private String enqurty_contact; // 
	private Date Enquiry_date; //
	
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
	public String getEnqurty_contact() {
		return enqurty_contact;
	}
	public void setEnqurty_contact(String enqurty_contact) {
		this.enqurty_contact = enqurty_contact;
	}
	public Date getEnquiry_date() {
		return Enquiry_date;
	}
	public void setEnquiry_date(Date enquiry_date) {
		Enquiry_date = enquiry_date;
	}
	
	
	
}
