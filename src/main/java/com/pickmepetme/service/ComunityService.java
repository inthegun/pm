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
	public boolean update(ComunityVO cvo);


	// 글 보기
	public ComunityVO pageview(int post_no);
}
