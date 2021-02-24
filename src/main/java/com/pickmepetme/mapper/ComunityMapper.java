package com.pickmepetme.mapper;

import java.util.List;

import com.pickmepetme.domain.ComunityVO;

public interface ComunityMapper {
	//프리커뮤니티 전체목록 조회
	public List<ComunityVO> getList();
}

