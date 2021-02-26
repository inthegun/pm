package com.pickmepetme.mapper;

import java.util.List;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;

public interface ComunityMapper {
	//프리커뮤니티 전체목록 조회
	public List<ComunityVO> getList(Criteria cri);

	// 전체 글 수
	public int getTotalCount(Criteria cri);

	// 수정
	public boolean update(ComunityVO cvo);
	
	// 글보기
	public ComunityVO pageview(int post_no);
}

