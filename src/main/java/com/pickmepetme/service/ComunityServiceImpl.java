package com.pickmepetme.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.mapper.ComunityMapper;

@Service
public class ComunityServiceImpl implements ComunityService{
	private static final Logger logger = LoggerFactory.getLogger(ComunityServiceImpl.class);
	
	@Autowired
	private ComunityMapper comunityMapper;

	@Override
	public List<ComunityVO> getList(Criteria cri) {
		logger.info("ComunityServiceImpl register를 실행합니다.");
		logger.info("get cri :" + cri);
		
		return comunityMapper.getList(cri);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		logger.info("ComunityServiceImpl getList.........");
		return comunityMapper.getTotalCount(cri);
		
	}

	//수정
		@Override
		public void update(ComunityVO vo) throws Exception {
			logger.info("ComunityServiceImpl update를 실행합니다.");
			comunityMapper.update(vo);
			
		}

	@Override
	public ComunityVO pageview(int post_no) {
		logger.info("ComunityServiceImpl pageview를 실행합니다.");
		return comunityMapper.pageview(post_no);
	}

	//삭제
		@Override
		public void delete(int post_no) throws Exception {
			logger.info("ComunityServiceImpl delete를 실행합니다.");
			comunityMapper.delete(post_no);
			
		}

	
	
	

}
