package com.pickmepetme.mapper;

import java.util.List;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;

public interface ComunityMapper {
	//프리커뮤니티 전체목록 조회
	public List<ComunityVO> getList(Criteria cri);

	// 전체 글 수
	public int getTotalCount(Criteria cri);

	//수정
	public void update(ComunityVO vo) throws Exception;
	
	// 글보기
	public ComunityVO pageview(int post_no);
	
	//삭제
	public void delete(int post_no) throws Exception;
	
	//게시판 조회 +1
	public boolean comunityHit(int post_no) throws Exception;
	
	//글삽입
	public void insertBoard(ComunityVO comunityvo);
}

