package com.pickmepetme.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.domain.PageVO;
import com.pickmepetme.domain.UserVO;
import com.pickmepetme.service.UserService;


// 회원 컨트롤러 
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
		public String postLogin(HttpServletRequest req, HttpServletResponse response,
				RedirectAttributes rttr,UserVO userVO , Model model) throws Exception {
			logger.info("로그인 처리 호출");
			
			HttpSession session = req.getSession();
			UserVO user = userService.login(userVO);
			
			if(user == null) {
				logger.info("로그인 처리안됨");
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg",false);
				return "redirect:/member/login";
			}else {
				logger.info("로그인 처리됨");
				session.setAttribute("member", user); 
				session.setAttribute("userId", user.getUser_id()); // id 
				session.setAttribute("userName", user.getUser_name()); // name 
				model.addAttribute("login", user);
				return "redirect:/";
			}
		
		}
		//로그아웃 처리
		@GetMapping("logout")
		public String  getLogout(HttpSession session) {
			logger.info("로그아웃 처리 호출");
			String check = (String) session.getAttribute("userId");
			if(check != null) {
				logger.info("로그아웃 처리됨");
				session.invalidate();
				return "redirect:/";
			}else {
				logger.info("비정상적 로그아웃 접근됨");
				return "redirect:/member/login";
			}
			
		}
		
		// 회원 정보 조회
		@RequestMapping(value="/info",method=RequestMethod.GET)
		public String member_info(HttpServletRequest req, HttpSession session, Model model) throws Exception{
			
			logger.info("회원 정보 조회 호출");
			// 세션 객체의 ID 정보를 가져옴 
			session = req.getSession();
			String id = (String) session.getAttribute("userId");
			logger.info("세션 아이디 :"+ id);
			
			// 회원정보 보기 메서드 호출
			UserVO userVO = userService.readMember(id);
			
			// 정보를 model에 저장후 페이지 이동
			model.addAttribute("UserInfo", userVO);
			return "member/info";
		}
		
		
		// 내가 쓴글
				@RequestMapping(value="/mywrite",method=RequestMethod.GET)
				public void mywrite(ComunityVO comunityvo , Model model,HttpServletRequest req,Criteria cri) {
					logger.info("내가 쓴글 조회");
					
					HttpSession sess=req.getSession();
					logger.info("!@#!!@#"+sess.getAttribute("userId"));
					cri.setUser_id((String) sess.getAttribute("userId"));
					ArrayList<ComunityVO> list =userService.mywrite(comunityvo,sess,cri);
					
					logger.info("list : "+ list.size() );
					
					int total = userService.mywriteCount(cri);
					logger.info("totall=" +  total);
					
					model.addAttribute("mywrite", list);
					model.addAttribute("pageMaker",new PageVO(cri, total));
					
					
					
				}
		
		// 회원 정보 수정
		@RequestMapping(value= "/memberUpdate",method =RequestMethod.POST)
		public String Memberupdate(UserVO vo, Model model) throws Exception{
			
			userService.memberUpdate(vo);
			
			return "redirect:/member/info";			
		}	
		
		// 회원 정보 수정
		@RequestMapping(value = "/alter" , method = RequestMethod.POST)
        public String Memberalter() {


            return "redirect:/member/alter";
        }
		
		// 회원 정보 수정
		@RequestMapping(value = "/alter" , method = RequestMethod.GET)
        public void MemberalterGet(HttpServletRequest req, HttpSession session, Model model) throws Exception {

            session = req.getSession();
            String id = (String) session.getAttribute("userId");
            UserVO userVO = userService.readMember(id);
            model.addAttribute("User",userVO);
            logger.info("alter Controller get");


        }
		
		
		// 회원 정보 삭제(탈퇴)
		
	
	
	
	
	
	
	
	

}
