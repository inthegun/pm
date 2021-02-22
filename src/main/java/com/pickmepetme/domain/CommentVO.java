package com.pickmepetme.domain;

import java.util.Date;

public class CommentVO {
	private Long comment_no;
	private String user_id;
	private Long post_id;
	private String comment_contact;
	private Date comment_date;
	public Long getComment_no() {
		return comment_no;
	}
	public void setComment_no(Long comment_no) {
		this.comment_no = comment_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Long getPost_id() {
		return post_id;
	}
	public void setPost_id(Long post_id) {
		this.post_id = post_id;
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
	
	
	
}
