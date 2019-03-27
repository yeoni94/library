package com.library.bookhistory.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhistory.service.BookHistoryService;
import com.library.bookhistory.vo.BookHistoryVO;
import com.library.user.vo.UserVO;

@Controller
@RequestMapping("/history/*")
public class BookHistoryController {
	
	@Resource(name="bookHistoryService")
	BookHistoryService bookHistoryService;
	
	@RequestMapping("BookHistoryView.do")
	public String bookHistoryView(ModelMap model, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
	    if(userVO != null) {
	    	String grade = userVO.getGrade();
	    	if(grade.equals("A")) {
	    		try {
					List<BookHistoryVO> bookHistoryList = bookHistoryService.bookHistorySelect(userVO.getId());
					model.addAttribute("bookHistoryList", bookHistoryList);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		return "book/BookHistory";
	    	}else {
	    		return "redirect:/main/UserMain.do";
	    	}
	    	
	    }else {
	    	return "redirect:/main/UserMain.do";	 
	    }
	}

}
