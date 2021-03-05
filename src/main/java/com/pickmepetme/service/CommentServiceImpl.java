package com.pickmepetme.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pickmepetme.controller.UserController;
import com.pickmepetme.domain.CommentVO;
import com.pickmepetme.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public void addComment(CommentVO commnetvo) {
		logger.info("addComment ServiceImpl!!!");
		commentMapper.addComment(commnetvo);
	}

	@Override
	public List<CommentVO> commentList(CommentVO commentvo) {
		logger.info("commentList ServiceImpl!! ");
		return commentMapper.commentList(commentvo);
	}

}
