package com.library.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.main.service.MainService;
import javax.annotation.Resource;

@Controller
public class MainConroller {
	  @Resource(name="mainService")
	  MainService mainService;

	  @RequestMapping("/main/UserMain.do")
	  public String userMain(Model model) {
			 try {
				model.addAttribute("inDayCount", mainService.inDayCount()); 
				model.addAttribute("outDayCount", mainService.outDayCount());
				model.addAttribute("newTop6", mainService.newTop6());
				model.addAttribute("borrowTop6", mainService.borrowTop6());
				model.addAttribute("newDay7Count", mainService.newDay7Count());
				model.addAttribute("borrowTotalCount", mainService.borrowTotalCount());
			} catch (Exception e) {
				e.getStackTrace();
			}
		  return "main/UserMain";
	  }
}
