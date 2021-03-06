package com.pickmepetme.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pickmepetme.controller.UserController;
import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.mapper.ComunityMapper;

@Service
public class ComunityServiceImpl implements ComunityService{
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);

   
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

   // 게시글 조회
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

      @Override
      public boolean comunityHit(int post_no) throws Exception {
         logger.info("service impl Comunity hit");
         return comunityMapper.comunityHit(post_no);
         
      }

	@Override
	public void insertBoard(ComunityVO comunityvo) {
		logger.info("커뮤니티 서비스Impl insert 실행함");
		
		comunityMapper.insertBoard(comunityvo);
		
	}
	
	/* 팁 게시판 구현 */

	@Override
	public List<ComunityVO> tipgetList(Criteria cri) {
		return comunityMapper.tipgetList(cri);
	}

	@Override
	public int tipgetTotalCount(Criteria cri) {
		 return comunityMapper.tipgetTotalCount(cri);
	}

	@Override
	public void tipupdate(ComunityVO vo) throws Exception {
		comunityMapper.tipupdate(vo);
	}

	@Override
	public ComunityVO tippageview(int post_no) {
		return comunityMapper.tippageview(post_no);
	}

	@Override
	public void tipdelete(int post_no) throws Exception {
		 comunityMapper.tipdelete(post_no);
	}

	@Override
	public boolean tipcomunityHit(int post_no) throws Exception {
		return comunityMapper.tipcomunityHit(post_no);
	}

	@Override
	public void tipinsertBoard(ComunityVO comunityvo) {
		comunityMapper.tipinsertBoard(comunityvo);
	}

	// 베스트팁 정렬
	@Override
	public List<ComunityVO> besttipgetList(Criteria cri) {
		return comunityMapper.besttipgetList(cri);
	}
	
	/* 돌봄 헬퍼게시판 구현 */

	@Override
	public List<ComunityVO> caregetList(Criteria cri) {
		return comunityMapper.caregetList(cri);
	}

	@Override
	public int caregetTotalCount(Criteria cri) {
		 return comunityMapper.caregetTotalCount(cri);
	}

	@Override
	public void careupdate(ComunityVO vo) throws Exception {
		comunityMapper.careupdate(vo);
	}

	@Override
	public ComunityVO carepageview(int post_no) {
		return comunityMapper.carepageview(post_no);
	}

	@Override
	public void caredelete(int post_no) throws Exception {
		 comunityMapper.caredelete(post_no);
	}

	@Override
	public boolean carecomunityHit(int post_no) throws Exception {
		return comunityMapper.carecomunityHit(post_no);
	}

	@Override
	public void careinsertBoard(ComunityVO comunityvo) {
		comunityMapper.careinsertBoard(comunityvo);
	}
	
	/* 돌봄 시터게시판 구현 */
	
	@Override
	public List<ComunityVO> sittergetList(Criteria cri) {
		return comunityMapper.sittergetList(cri);
	}

	@Override
	public int sittergetTotalCount(Criteria cri) {
		 return comunityMapper.sittergetTotalCount(cri);
	}

	@Override
	public void sitterupdate(ComunityVO vo) throws Exception {
		comunityMapper.sitterupdate(vo);
	}

	@Override
	public ComunityVO sitterpageview(int post_no) {
		return comunityMapper.sitterpageview(post_no);
	}

	@Override
	public void sitterdelete(int post_no) throws Exception {
		 comunityMapper.sitterdelete(post_no);
	}

	@Override
	public boolean sittercomunityHit(int post_no) throws Exception {
		return comunityMapper.sittercomunityHit(post_no);
	}

	@Override
	public void sitterinsertBoard(ComunityVO comunityvo) {
		comunityMapper.sitterinsertBoard(comunityvo);
	}

/* 분양 게시판 구현 */
	
	@Override
	public List<ComunityVO> parcelgetList(Criteria cri) {
		return comunityMapper.parcelgetList(cri);
	}

	@Override
	public int parcelgetTotalCount(Criteria cri) {
		 return comunityMapper.parcelgetTotalCount(cri);
	}

	@Override
	public void parcelupdate(ComunityVO vo) throws Exception {
		comunityMapper.parcelupdate(vo);
	}

	@Override
	public ComunityVO parcelpageview(int post_no) {
		return comunityMapper.parcelpageview(post_no);
	}

	@Override
	public void parceldelete(int post_no) throws Exception {
		 comunityMapper.parceldelete(post_no);
	}

	@Override
	public boolean parcelcomunityHit(int post_no) throws Exception {
		return comunityMapper.parcelcomunityHit(post_no);
	}

	@Override
	public void parcelinsertBoard(ComunityVO comunityvo) {
		comunityMapper.parcelinsertBoard(comunityvo);
	}

      

}