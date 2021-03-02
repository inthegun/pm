package com.pickmepetme.service;

import java.util.List;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;

public interface ComunityService {
	
	
	// 리스트
	public List<ComunityVO> getList(Criteria cri);

	
	// 글 수 
	public int getTotal(Criteria cri);
	
	//수정
	public void update(ComunityVO vo) throws Exception;


	// 글 보기
	public ComunityVO pageview(int post_no);
	
	//삭제
	public void delete(int post_no) throws Exception;
}
