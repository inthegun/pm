package com.pickmepetme.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pickmepetme.domain.CommentVO;
import com.pickmepetme.domain.UserVO;
import com.pickmepetme.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/addComment" ,method = RequestMethod.POST )
	@ResponseBody
public String ajax_addComment(@ModelAttribute("commentVO") CommentVO commentVO, HttpServletRequest request) throws Exception{
		
		logger.info("addComment Controller!!!");
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO)session.getAttribute("userVO");
        logger.info("addComment Controller2!!!");
        try{
   
            commentService.addComment(commentVO);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
    
    /**
     * 게시물 댓글 불러오기(Ajax)
     * @param boardVO
     * @param request
     * @return
     * @throws Exception
     */
	
	  @RequestMapping(value="/commentList",
	  produces="application/json; charset=utf8")
	  
	  @ResponseBody 
	  public ResponseEntity ajax_commentList
	  (@ModelAttribute("commentVO") CommentVO commentVO, HttpServletRequest request) throws Exception{
	  
	  HttpHeaders responseHeaders = new HttpHeaders(); 
	  ArrayList<HashMap> hmlist =  new ArrayList<HashMap>();
	  logger.info("hmlist1: "+hmlist);
	  // 해당 게시물 댓글 
	  List<CommentVO> commentVOList = commentService.commentList(commentVO);
	  logger.info("!!"+commentVOList);
	  logger.info("hmlist2: "+hmlist);
	  
	  if(commentVOList.size()>0) {
	  for(int i=0; i<commentVOList.size(); i++){ 
	  HashMap hm = new HashMap(); 
	  hm.put("comment_no", commentVOList.get(i).getComment_no());
	  hm.put("comment_contact", commentVOList.get(i).getComment_contact()); 
	  hm.put("user_id",  commentVOList.get(i).getUser_id());
	  logger.info("hmlist3: "+hmlist);
	  
	  
	  hmlist.add(hm); 
	  }
	  }
	  
	  
	  
	  JSONArray json = new JSONArray(hmlist); 
	  return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	  
	  } 
}
	 



