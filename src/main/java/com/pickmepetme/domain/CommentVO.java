package com.pickmepetme.domain;

import java.util.Date;

public class CommentVO {
	private int comment_no;
	private String comunity_id;
	private String user_id;
	private int post_no;
	private String comment_contact;
	private Date comment_date;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getComment_contact() {
		return comment_contact;
	}
	public void setComment_contact(String comment_contact) {
		this.comment_contact = comment_contact;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComunity_id() {
		return comunity_id;
	}
	public void setComunity_id(String comunity_id) {
		this.comunity_id = comunity_id;
	}
	
	
}
