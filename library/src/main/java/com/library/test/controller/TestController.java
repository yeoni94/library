package com.library.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.user.vo.UserVO;

@Controller
public class TestController {

	 @RequestMapping("/")
	 public String index(Model model) {
		 model.addAttribute("name", "Spring Boot");
		 return "test/index";
	 }
	 
	 @RequestMapping("/test")
	 public String test(Model model) {
		 model.addAttribute("ID", "Spring Boot");
		// return "test/buttons";
		 return "test/icons";
	 }
	 
	 @RequestMapping("/headerTest")
	 public String headerTest(Model model, HttpSession session) {
		 UserVO userVO = new UserVO();
		 userVO.setName("김가연");
		 session.setAttribute("UserVO", userVO);
		 return "main/inc/Header";
	 }
	 
	 @RequestMapping("/footerTest")
	 public String footerTest(Model model) {
		 return "main/inc/Footer";
	 }
}
