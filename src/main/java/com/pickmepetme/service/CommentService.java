package com.pickmepetme.service;

import java.util.List;

import com.pickmepetme.domain.CommentVO;

public interface CommentService {
	
	//댓글추가
	public void addComment(CommentVO commnetvo);
	
	//댓글리스트
	public List<CommentVO> commentList(CommentVO commentvo);


}
