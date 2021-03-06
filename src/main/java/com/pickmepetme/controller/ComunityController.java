package com.pickmepetme.controller;

import java.io.File;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.domain.PageVO;
import com.pickmepetme.domain.UserVO;
import com.pickmepetme.service.ComunityService;
import com.pickmepetme.service.UserService;
import com.pickmepetme.utils.UploadFileUtils;


@Controller
@RequestMapping("/community")
public class ComunityController {
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);
   
   @Autowired
   ComunityService comunityService;
   
   @Autowired
   UserService userservice;
   
   @Resource(name="uploadPath")
   private String uploadPath;
   
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
      public void insert(ComunityVO comunityvo,Model model,HttpSession session) {
    	  logger.info("자유게시판 글 삽입 폼 호출됨");
    	  
    	  String id = (String) session.getAttribute("userId");
    	  UserVO uservo = userservice.readMember(id);
    	  
    	  model.addAttribute("user_id", uservo.getUser_id());
    	  model.addAttribute("comunityvo", new ComunityVO());
    	  
	  
    	  
      }
      
   // 글 넣기 처리
      @RequestMapping(value="free_community/insert",method=RequestMethod.POST)
      public String PostInsert(ComunityVO comunityvo,MultipartFile file,Model model) throws Exception {
    	  logger.info("자유게시판 글 삽입 처리 호출됨");
    	  logger.info("file:" + file);  	  
     	 String imgUploadPath = uploadPath + File.separator + "imgUpload";
     	 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
     	 String fileName = null;
     	 
     	 if(file.getOriginalFilename() != "") {
     	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
      	 comunityvo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
      	 comunityvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
     	  
     	 }else {
           	 comunityvo.setGdsImg(null);
           	 comunityvo.setGdsThumbImg(null);
     		 
     	 }
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
      
      
      /* -------------------------팁 게시판 컨트롤러 --------------------------------*/
   // 게시글 리스트
      @RequestMapping(value= {"/tip_community/list","/besttip_community/list"},method=RequestMethod.GET)
      public String tip_list(Criteria cri, Model model, HttpServletRequest req) {
    	  
    	  if(req.getServletPath().equals("/community/tip_community/list")) {
    		  logger.info("ComunityController tip_list... : " + cri);
    	         model.addAttribute("tip_list", comunityService.tipgetList(cri));
    	         
    	         int total = comunityService.tipgetTotalCount(cri);
    	         model.addAttribute("pageMaker", new PageVO(cri,total));
    	         
    	         return "/community/tip_community/list";
    	         
    	  }
			
			else {
			  	logger.info("베스트팁 리스트 호출됨");
			  	
			  	 model.addAttribute("tip_list", comunityService.besttipgetList(cri));
			  	
			  	
			  	return "/community/besttip_community/list";
			  	
			}
			
		
         
         
      }
      
   // 글 넣기 폼 
      @RequestMapping(value="tip_community/insert",method=RequestMethod.GET)
      public void tip_insert(ComunityVO comunityvo,Model model,HttpSession session) {
    	  logger.info("팁 게시판 글 삽입 폼 호출됨");
    	  
    	  String id = (String) session.getAttribute("userId");
    	  UserVO uservo = userservice.readMember(id);
    	  
    	  model.addAttribute("user_id", uservo.getUser_id());
    	  model.addAttribute("comunityvo", new ComunityVO());
    	  
	  
    	  
      }
      
      // 글 넣기 처리
      @RequestMapping(value="tip_community/insert",method=RequestMethod.POST)
      public String tipPostInsert(ComunityVO comunityvo,MultipartFile file,Model model) throws Exception {
    	  logger.info("팁게시판 글 삽입 처리 호출됨");
    	  logger.info("file:" + file);  	  
     	 String imgUploadPath = uploadPath + File.separator + "imgUpload";
     	 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
     	 String fileName = null;
     	 
     	 if(file.getOriginalFilename() != "") {
     	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
      	 comunityvo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
      	 comunityvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
     	  
     	 }else {
           	 comunityvo.setGdsImg(null);
           	 comunityvo.setGdsThumbImg(null);
     		 
     	 }
     	 comunityService.tipinsertBoard(comunityvo);
     	
    	  return "redirect:/community/tip_community/list";
      }
      
    //게시글 상세보기
      @RequestMapping(value = "/tip_community/view", method = RequestMethod.GET)
      public String tipgetPageview(@RequestParam("post_no") int post_no, Model model) throws Exception {
         ComunityVO view = null;
         view =  comunityService.tippageview(post_no);
         model.addAttribute("view", view);
         
         /* 조회수 +1 */
         comunityService.tipcomunityHit(post_no);
         
         return "community/tip_community/view";
      }
      
    //수정 폼
      @RequestMapping(value = "/tip_community/update", method = RequestMethod.GET)
      public void tipgetUpdate(@RequestParam("post_no") int post_no, Model model) throws Exception{
         
         ComunityVO vo = comunityService.tippageview(post_no);
         
         model.addAttribute("view", vo);
         
         
      }
      
// 수정처리
@RequestMapping(value = "/tip_community/update", method = RequestMethod.POST)
public String tippostUpdate(ComunityVO vo, HttpServletRequest hsq) throws Exception{
   comunityService.tipupdate(vo);
   return "redirect:/community/tip_community/view?post_no=" + vo.getPost_no();
}   

//게시글삭제
@RequestMapping(value="/tip_community/delete", method = RequestMethod.GET)
public String tipgetDelete(@RequestParam("post_no") int post_no)throws Exception{
   comunityService.tipdelete(post_no);
   return "redirect:/community/tip_community/list";
}
      
/* -------------------------돌봄 헬퍼게시판 컨트롤러 --------------------------------*/
//게시글 리스트
@RequestMapping(value="/care_community/list",method=RequestMethod.GET)
public void care_list(Criteria cri, Model model) {
   logger.info("ComunityController care_list... : " + cri);
   model.addAttribute("care_list", comunityService.caregetList(cri));
   
   int total = comunityService.caregetTotalCount(cri);
   
   model.addAttribute("pageMaker", new PageVO(cri,total));
   
   
}

//글 넣기 폼 
@RequestMapping(value="care_community/insert",method=RequestMethod.GET)
public void care_insert(ComunityVO comunityvo,Model model,HttpSession session) {
	  logger.info("팁 게시판 글 삽입 폼 호출됨");
	  
	  String id = (String) session.getAttribute("userId");
	  UserVO uservo = userservice.readMember(id);
	  
	  model.addAttribute("user_id", uservo.getUser_id());
	  model.addAttribute("comunityvo", new ComunityVO());
	  
	  
	  
}

// 글 넣기 처리
@RequestMapping(value="care_community/insert",method=RequestMethod.POST)
public String carePostInsert(ComunityVO comunityvo,MultipartFile file,Model model) throws Exception {
	  logger.info("돌봄게시판 글 삽입 처리 호출됨");
	  logger.info("file:" + file);  	  
	 String imgUploadPath = uploadPath + File.separator + "imgUpload";
	 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	 String fileName = null;
	 
	 if(file.getOriginalFilename() != "") {
	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	 comunityvo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	 comunityvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	  
	 }else {
     	 comunityvo.setGdsImg(null);
     	 comunityvo.setGdsThumbImg(null);
		 
	 }
	 comunityService.careinsertBoard(comunityvo);
	
	  return "redirect:/community/care_community/list";
}
//게시글 상세보기
@RequestMapping(value = "/care_community/view", method = RequestMethod.GET)
public String caregetPageview(@RequestParam("post_no") int post_no, Model model) throws Exception {
   ComunityVO view = null;
   view =  comunityService.carepageview(post_no);
   model.addAttribute("view", view);
   
   /* 조회수 +1 */
   comunityService.carecomunityHit(post_no);
   
   return "community/care_community/view";
}

//수정 폼
@RequestMapping(value = "/care_community/update", method = RequestMethod.GET)
public void caregetUpdate(@RequestParam("post_no") int post_no, Model model) throws Exception{
   
   ComunityVO vo = comunityService.carepageview(post_no);
   
   model.addAttribute("view", vo);
   
   
}

//수정처리
@RequestMapping(value = "/care_community/update", method = RequestMethod.POST)
public String carepostUpdate(ComunityVO vo, HttpServletRequest hsq) throws Exception{
comunityService.careupdate(vo);
return "redirect:/community/care_community/view?post_no=" + vo.getPost_no();
}   

//게시글삭제
@RequestMapping(value="/care_community/delete", method = RequestMethod.GET)
public String caregetDelete(@RequestParam("post_no") int post_no)throws Exception{
comunityService.caredelete(post_no);
return "redirect:/community/care_community/list";
}
   

/* -------------------------돌봄 시터게시판 컨트롤러 --------------------------------*/
//게시글 리스트
@RequestMapping(value="/sitter_community/list",method=RequestMethod.GET)
public void sitter_list(Criteria cri, Model model) {
logger.info("ComunityController sitter_list... : " + cri);
model.addAttribute("sitter_list", comunityService.sittergetList(cri));

int total = comunityService.sittergetTotalCount(cri);

model.addAttribute("pageMaker", new PageVO(cri,total));


}

//글 넣기 폼 
@RequestMapping(value="sitter_community/insert",method=RequestMethod.GET)
public void sitter_insert(ComunityVO comunityvo,Model model,HttpSession session) {
	  logger.info("팁 게시판 글 삽입 폼 호출됨");
	  
	  String id = (String) session.getAttribute("userId");
	  UserVO uservo = userservice.readMember(id);
	  
	  model.addAttribute("user_id", uservo.getUser_id());
	  model.addAttribute("comunityvo", new ComunityVO());
	  
	  
	  
}

// 글 넣기 처리
@RequestMapping(value="sitter_community/insert",method=RequestMethod.POST)
public String sitterPostInsert(ComunityVO comunityvo,MultipartFile file,Model model) throws Exception {
	  logger.info("팁게시판 글 삽입 처리 호출됨");
	  logger.info("file:" + file);  	  
	 String imgUploadPath = uploadPath + File.separator + "imgUpload";
	 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	 String fileName = null;
	 
	 if(file.getOriginalFilename() != "") {
	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	 comunityvo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	 comunityvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	  
	 }else {
     	 comunityvo.setGdsImg(null);
     	 comunityvo.setGdsThumbImg(null);
		 
	 }
	 comunityService.sitterinsertBoard(comunityvo);
	
	  return "redirect:/community/sitter_community/list";
}

//게시글 상세보기
@RequestMapping(value = "/sitter_community/view", method = RequestMethod.GET)
public String sittergetPageview(@RequestParam("post_no") int post_no, Model model) throws Exception {
ComunityVO view = null;
view =  comunityService.sitterpageview(post_no);
model.addAttribute("view", view);

/* 조회수 +1 */
comunityService.sittercomunityHit(post_no);

return "community/sitter_community/view";
}

//수정 폼
@RequestMapping(value = "/sitter_community/update", method = RequestMethod.GET)
public void sittergetUpdate(@RequestParam("post_no") int post_no, Model model) throws Exception{

ComunityVO vo = comunityService.sitterpageview(post_no);

model.addAttribute("view", vo);


}

//수정처리
@RequestMapping(value = "/sitter_community/update", method = RequestMethod.POST)
public String sitterpostUpdate(ComunityVO vo, HttpServletRequest hsq) throws Exception{
comunityService.sitterupdate(vo);
return "redirect:/community/sitter_community/view?post_no=" + vo.getPost_no();
}   

//게시글삭제
@RequestMapping(value="/sitter_community/delete", method = RequestMethod.GET)
public String sittergetDelete(@RequestParam("post_no") int post_no)throws Exception{
comunityService.sitterdelete(post_no);
return "redirect:/community/sitter_community/list";
}  

/* -------------------------분양게시판 컨트롤러 --------------------------------*/
//게시글 리스트
@RequestMapping(value="/parcel_community/list",method=RequestMethod.GET)
public void parcel_list(Criteria cri, Model model) {
logger.info("ComunityController parcel_list... : " + cri);
model.addAttribute("parcel_list", comunityService.parcelgetList(cri));

int total = comunityService.parcelgetTotalCount(cri);

model.addAttribute("pageMaker", new PageVO(cri,total));


}

//글 넣기 폼 
@RequestMapping(value="parcel_community/insert",method=RequestMethod.GET)
public void parcel_insert(ComunityVO comunityvo,Model model,HttpSession session) {
	  logger.info("팁 게시판 글 삽입 폼 호출됨");
	  
	  String id = (String) session.getAttribute("userId");
	  UserVO uservo = userservice.readMember(id);
	  
	  model.addAttribute("user_id", uservo.getUser_id());
	  model.addAttribute("comunityvo", new ComunityVO());
	  
	  
	  
}

//글 넣기 처리
@RequestMapping(value="parcel_community/insert",method=RequestMethod.POST)
public String parcelPostInsert(ComunityVO comunityvo,MultipartFile file,Model model) throws Exception {
	  logger.info("팁게시판 글 삽입 처리 호출됨");
	  logger.info("file:" + file);  	  
	 String imgUploadPath = uploadPath + File.separator + "imgUpload";
	 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	 String fileName = null;
	 
	 if(file.getOriginalFilename() != "") {
	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	 comunityvo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	 comunityvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	  
	 }else {
 	 comunityvo.setGdsImg(null);
 	 comunityvo.setGdsThumbImg(null);
		 
	 }
	 comunityService.parcelinsertBoard(comunityvo);
	
	  return "redirect:/community/parcel_community/list";
}

//게시글 상세보기
@RequestMapping(value = "/parcel_community/view", method = RequestMethod.GET)
public String parcelgetPageview(@RequestParam("post_no") int post_no, Model model) throws Exception {
ComunityVO view = null;
view =  comunityService.parcelpageview(post_no);
model.addAttribute("view", view);

/* 조회수 +1 */
comunityService.parcelcomunityHit(post_no);

return "community/parcel_community/view";
}

//수정 폼
@RequestMapping(value = "/parcel_community/update", method = RequestMethod.GET)
public void parcelgetUpdate(@RequestParam("post_no") int post_no, Model model) throws Exception{

ComunityVO vo = comunityService.parcelpageview(post_no);

model.addAttribute("view", vo);


}

//수정처리
@RequestMapping(value = "/parcel_community/update", method = RequestMethod.POST)
public String parcelpostUpdate(ComunityVO vo, HttpServletRequest hsq) throws Exception{
comunityService.parcelupdate(vo);
return "redirect:/community/parcel_community/view?post_no=" + vo.getPost_no();
}   

//게시글삭제
@RequestMapping(value="/parcel_community/delete", method = RequestMethod.GET)
public String parcelgetDelete(@RequestParam("post_no") int post_no)throws Exception{
comunityService.parceldelete(post_no);
return "redirect:/community/parcel_community/list";
}  
      
   

}
