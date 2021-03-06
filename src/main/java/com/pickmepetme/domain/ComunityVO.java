package com.pickmepetme.domain;

import java.util.Date;

public class ComunityVO {
   private Long post_no;
   private String user_id;
   private String comunity_id;
   private String post_title;
   private String post_contact;
   private int price;
   private Date post_date;
   private int hit;
   private String gdsImg;
   
   private String gdsThumbImg;
   
   
   public Long getPost_no() {
      return post_no;
   }
   public void setPost_no(Long post_no) {
      this.post_no = post_no;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getPost_title() {
      return post_title;
   }
   public void setPost_title(String post_title) {
      this.post_title = post_title;
   }
   public String getPost_contact() {
      return post_contact;
   }
   public void setPost_contact(String post_contact) {
      this.post_contact = post_contact;
   }
   public int getPrice() {
		return price;
   }
   public void setPrice(int price) {
	   this.price = price;
   }
   public Date getPost_date() {
      return post_date;
   }
   public void setPost_date(Date post_date) {
      this.post_date = post_date;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public String getGdsImg() {
      return gdsImg;
   }
   public void setGdsImg(String gdsImg) {
      this.gdsImg = gdsImg;
   }
   public String getGdsThumbImg() {
      return gdsThumbImg;
   }
   public void setGdsThumbImg(String gdsThumbImg) {
      this.gdsThumbImg = gdsThumbImg;
   }
public String getComunity_id() {
	return comunity_id;
}
public void setComunity_id(String comunity_id) {
	this.comunity_id = comunity_id;
}
   
   
   
}