package com.pickmepetme.mapper;

import java.util.List;

import com.pickmepetme.domain.CommentVO;

public interface CommentMapper {
	
	public List<CommentVO> commentList(CommentVO commentvo);

	public void addComment(CommentVO commentvo);

}
