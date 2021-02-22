package com.pickmepetme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pickmepetme.domain.UserVO;
import com.pickmepetme.service.UserService;

@Controller
@RequestMapping("/member")
public class UserController {
	//로거
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 의존 자동 주입
	@Autowired
	UserService userService;
	
	// 회원가입 폼 
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model) {
		logger.info("회원가입 폼 호출됨");
		model.addAttribute("uservo", new UserVO());
		return "member/register";
	}
	
	// 회원가입 처리 
	//@RequestMapping(value="/register.do",method=RequestMethod.POST)
	//public String 
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(UserVO uservo) {
		logger.info("UserController register..");
		userService.register(uservo);
		return "redirect:/"; 
	}
	
	// 로그인 폼
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String getLogin() {
		logger.info("로그인 호출");
		return "member/login";
	}
		
		// 로그인 처리
		@RequestMapping(value="/login_ok",method=RequestMethod.POST)
		public String postLogin(HttpSession session,HttpServletRequest req,
				RedirectAttributes rttr,UserVO userVO , Model model) throws Exception {
			logger.info("로그인 처리 호출");
			
			session = req.getSession();
			UserVO login = userService.login(userVO);
			
			if(login == null) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg",false);
				return "redirect:/login";
			}else {
				session.setAttribute("member", login);
				model.addAttribute("login", login);
				return "home";
			}
		
		}
		//로그아웃 처리
		@GetMapping("logout")
		public String  getLogout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
	
	
	
	
	
	
	
	

}
