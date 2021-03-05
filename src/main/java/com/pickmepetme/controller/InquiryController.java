package com.pickmepetme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pickmepetme.domain.InquiryVO;
import com.pickmepetme.service.InquiryService;

@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {
		//로거
		private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
		
		// 의존 자동 주입
		@Autowired
		InquiryService inquiryservice;
		
		
		//자주 묻는 질문 
		@RequestMapping(value="/FAQ",method=RequestMethod.GET)
		public void viewFAQ() throws Exception {
			logger.info("자주 묻는 질문 호출됨");
			
		}
		
		// 1대1 문의 리스트 
		@RequestMapping(value="/inquirylist",method=RequestMethod.GET)
		public String inquirylist(@ModelAttribute("inquiry") InquiryVO inquiryvo , Model model ,HttpServletRequest req) {
			logger.info("1대1 문의 리스트 호출됨");
			
			HttpSession session= req.getSession();
			
			String userId =(String) session.getAttribute("userId");
			
			// 로그인 안되어있을때
			if(userId ==null) {
				logger.info("로그인 되어있지 않음");
				session.setAttribute("member", null);
				
			}else {
				logger.info("로그인 되어있음");
				model.addAttribute("userId", userId);
				model.addAttribute("inquiryvo", inquiryservice.getList(inquiryvo,session));
			}
			return "inquiry/inquirylist";
		}
		
	
		
		
		// 1대1 문의 작성 폼
		@RequestMapping(value="inquiry_register")
		public void inquiryregister(Model model) {
			logger.info("1대1 문의 작성 폼 호출됨");
			
			model.addAttribute("inquiryVO", new InquiryVO());
			
		}
		
		// 1대1 문의 작성 처리
		@RequestMapping(value="inquiry_register",method=RequestMethod.POST)
		public String Doinquiryregister(InquiryVO inquiryvo , Model model,HttpSession session) {
			logger.info("1대1 문의 작성 처리 호출됨");
			inquiryservice.registerInquiry(inquiryvo,session);
			
			return "redirect:/inquiry/inquirylist";
		}
		
		// 1대1 문의 보기 
		@RequestMapping(value="inquiry_view",method=RequestMethod.GET)
        public String getInquiryView(@RequestParam("no") int no,@RequestParam("userid") String userid, InquiryVO inquiryvo,Model model) throws Exception {

            logger.info("1대1 문의 보기 호출됨 ");

            inquiryvo = inquiryservice.pageview(no,userid);

            model.addAttribute("view", inquiryvo);

            return "inquiry/inquiry_view";
        }
		
		
		
		
		

}
