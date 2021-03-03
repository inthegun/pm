package com.pickmepetme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.domain.PageVO;
import com.pickmepetme.domain.UserVO;
import com.pickmepetme.service.ComunityService;
import com.pickmepetme.service.UserService;


@Controller
@RequestMapping("/community")
public class ComunityController {
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);
   
   @Autowired
   ComunityService comunityService;
   
   @Autowired
   UserService userservice;
   
   
   ComunityVO comunityVO;
   
   // 게시글 리스트
   @RequestMapping(value="/free_community/list",method=RequestMethod.GET)
   public void free_list(Criteria cri, Model model) {
      logger.info("ComunityController free_list... : " + cri);
      model.addAttribute("free_list", comunityService.getList(cri));
      
      int total = comunityService.getTotal(cri);
      
      model.addAttribute("pageMaker", new PageVO(cri,total));
      
      
   }
   
   //게시글 상세보기
      @RequestMapping(value = "/free_community/view", method = RequestMethod.GET)
      public String getPageview(@RequestParam("post_no") int post_no, Model model) throws Exception {
         ComunityVO view = null;
         view =  comunityService.pageview(post_no);
         model.addAttribute("view", view);
         logger.info("형왔다"+view);
         
         /* 조회수 +1 */
         comunityService.comunityHit(post_no);
         
         return "community/free_community/view";
      }
      
      // 글 넣기 폼 
      @RequestMapping(value="free_community/insert",method=RequestMethod.GET)
      public void insert(ComunityVO comunityvo, Model model,HttpSession session) {
    	  logger.info("자유게시판 글 삽입 폼 호출됨");
    	  
    	  String id = (String) session.getAttribute("userId");
    	  UserVO uservo = userservice.readMember(id);
    	  
    	  model.addAttribute("user_id", uservo.getUser_id());
    	  model.addAttribute("comunityvo", new ComunityVO());
      }
      
      // 글 넣기 처리
      @RequestMapping(value="free_community/insert",method=RequestMethod.POST)
      public String PostInsert(ComunityVO comunityvo,Model model) {
    	  logger.info("자유게시판 글 삽입 처리 호출됨");
    	  comunityService.insertBoard(comunityvo);
    	  
    	  return "redirect:/community/free_community/list";
      }
      
      
      /*
      // 게시물 수정
         @RequestMapping(value = "/free_community/update", method = RequestMethod.GET)
         public String getUpdate(@RequestParam("post_no") int post_no, Model model) throws Exception {
            ComunityVO view = null;
            view =  comunityService.pageview(post_no);
            
            model.addAttribute("view", view);
            return "community/free_community/update";
         }*/
      
      //수정 폼
            @RequestMapping(value = "/free_community/update", method = RequestMethod.GET)
            public void getUpdate(@RequestParam("post_no") int post_no, Model model) throws Exception{
               
               ComunityVO vo = comunityService.pageview(post_no);
               
               model.addAttribute("view", vo);
               
               
            }
            
      // 수정처리
      @RequestMapping(value = "/free_community/update", method = RequestMethod.POST)
      public String postUpdate(ComunityVO vo, HttpServletRequest hsq) throws Exception{
         comunityService.update(vo);
         return "redirect:/community/free_community/view?post_no=" + vo.getPost_no();
      }   
      
      //게시글삭제
      @RequestMapping(value="/free_community/delete", method = RequestMethod.GET)
      public String getDelete(@RequestParam("post_no") int post_no)throws Exception{
         comunityService.delete(post_no);
         return "redirect:/community/free_community/list";
      }
   

}
