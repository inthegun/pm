package com.pickmepetme.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.domain.PageVO;
import com.pickmepetme.domain.UserVO;
import com.pickmepetme.service.ComunityService;


@Controller
@RequestMapping("/community")
public class ComunityController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	ComunityService comunityService;
	ComunityVO comunityVO;
	
	@RequestMapping(value="/free_community/list",method=RequestMethod.GET)
	
	public void free_list(Criteria cri, Model model) {
		logger.info("ComunityController free_list...");
		model.addAttribute("free_list", comunityService.getList());
		model.addAttribute("pagemaker", new PageVO(cri,123));
		
	}

}
