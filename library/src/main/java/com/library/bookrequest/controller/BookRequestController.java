package com.library.bookrequest.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.bookrequest.service.BookRequestService;
import com.library.bookrequest.vo.BookRequestVO;
import com.library.user.vo.UserVO;

@Controller
@RequestMapping("/request/*")
public class BookRequestController {

	@Resource(name = "bookRequestService")
	BookRequestService bookRequestService;

	@RequestMapping("BookRequestRegistView.do")
	public String bookRequestRegistView(HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if (userVO != null) {
			String grade = userVO.getGrade();
			if (grade.equals("A")) {
				return "request/BookRequestRegist";
			} else {
				return "redirect:/main/UserMain.do";
			}
		} else {
			return "redirect:/main/UserMain.do";
		}
	}

	@RequestMapping("BookRequestRegist.do")
	public String bookRequestRegist(@ModelAttribute("bookRequestVO") BookRequestVO bookRequestVO, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if (userVO != null) {
			String returnValue = "";
			String grade = userVO.getGrade();
			if (grade.equals("A")) {
				try {
					bookRequestVO.setId(userVO.getId());
					bookRequestVO.setCreate_user(userVO.getName());
					bookRequestVO.setUpdate_user(userVO.getName());
					bookRequestService.bookRequestInsert(bookRequestVO);
					redirectAttributes.addFlashAttribute("message", "도서 신청 성공하였습니다.");
					returnValue = "redirect:/request/BookRequestList.do";
				} catch (Exception e) {
					e.printStackTrace();
					redirectAttributes.addFlashAttribute("message", "도서 신청 실패하였습니다.");
					returnValue = "redirect:/request/BookRequestRegistView.do";
				}
				return returnValue;
			} else {
				return "redirect:/main/UserMain.do";
			}
		} else {
			return "redirect:/main/UserMain.do";
		}
	}

	@RequestMapping("BookRequestList.do")
	public String bookRequestList(HttpSession session, ModelMap model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if (userVO != null) {
			String grade = userVO.getGrade();
			if (grade.equals("A")) {
				try {
					List<BookRequestVO> bookRequestList = bookRequestService.bookRequestList(userVO.getId());
					model.addAttribute("bookRequestList", bookRequestList);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "request/BookRequestList";
			} else {
				return "redirect:/main/UserMain.do";
			}
		} else {
			return "redirect:/main/UserMain.do";
		}
	}

	@RequestMapping("BookRequestApproveView.do")
	public String bookRequestListApproveView(HttpSession session, ModelMap model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if (userVO != null) {
			String grade = userVO.getGrade();
			if (grade.equals("S")) {
				try {
					List<BookRequestVO> bookRequestList = bookRequestService.bookRequestListAdmin();
					model.addAttribute("bookRequestList", bookRequestList);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "request/BookRequestApprove";
			} else {
				return "redirect:/main/UserMain.do";
			}
		} else {
			return "redirect:/main/UserMain.do";
		}
	}

	@RequestMapping("BookRequestApproveOne.do")
	public String bookRequestApproveOne(HttpSession session, ModelMap model,
			@RequestParam(value = "rseq") int rseq,  @RequestParam(value = "state") String state) {
		BookRequestVO bookRequestVO = new BookRequestVO();
		bookRequestVO.setRseq(rseq);
		bookRequestVO.setState(state);
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if (userVO != null) {
			String grade = userVO.getGrade();
			if (grade.equals("S")) {
				try {
					bookRequestService.bookRequestApproveOneUpdate(bookRequestVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "redirect:/request/BookRequestApproveView.do";
			} else {
				return "redirect:/main/UserMain.do";
			}
		} else {
			return "redirect:/main/UserMain.do";
		}
	}
	
	@RequestMapping("BookRequestApproveList.do")
	public String bookRequestApproveList(@ModelAttribute("bookRequestVO") BookRequestVO bookRequestVO, HttpSession session, ModelMap model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if (userVO != null) {
			String grade = userVO.getGrade();
			if (grade.equals("S")) {
			  if(bookRequestVO.getBookRequestVOList() != null) {
		        try {
		          for(BookRequestVO request : bookRequestVO.getBookRequestVOList()) {
		        	  if(request.getRegistApprove() != null && request.getRegistApprove().equals("Y")) {
		        		  bookRequestService.bookRequestApproveListUpdate(request);
		        	  }
		          }
		        }catch(Exception e) {
		        	e.printStackTrace();
		        	
		        }
			  }
				return "redirect:/request/BookRequestApproveView.do";
			} else {
				return "redirect:/main/UserMain.do";
			}
		} else {
			return "redirect:/main/UserMain.do";
		}
	}
}
