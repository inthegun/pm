package com.pickmepetme.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.mapper.ComunityMapper;

@Service
public class ComunityServiceImpl implements ComunityService{
	private static final Logger logger = LoggerFactory.getLogger(ComunityServiceImpl.class);
	
	@Autowired
	private ComunityMapper comunityMapper;

	@Override
	public List<ComunityVO> getList() {
		logger.info("ComunityServiceImpl register를 실행합니다.");
		
		return comunityMapper.getList(); 
		
	}
	
	

}
