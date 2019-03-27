package com.library.book.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.book.service.BookService;
import com.library.bookinfo.vo.BookInfoVO;
import com.library.bookinfo.vo.BookSearchVO;
import com.library.user.vo.UserVO;

@Controller
@RequestMapping("/book/*")
public class BookController {

	@Resource(name="bookService")
	BookService bookService;
	
	@RequestMapping("BookSearchView.do")
	public String bookSearchView() {
		return "book/BookSearch";
	}
	
	@RequestMapping("BookSearchDetailSelect.do")
	public String bookSearchDetailSelect(@ModelAttribute("bookSearchVO") BookSearchVO bookSearchVO, ModelMap model) {
		
		try {
			List<BookInfoVO> bookList = bookService.bookSearchDetailSelect(bookSearchVO);
			model.addAttribute("bookList", bookList);	
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "book/BookList";
	}
	
	@RequestMapping("BookSearchIntegratedSelect.do")
	public String bookSearchIntegratedSelect(@ModelAttribute("bookSearchVO") BookSearchVO bookSearchVO, ModelMap model) {
		
		try {
		 if(bookSearchVO.getIntegratedSearchKeyword() != null &&  !bookSearchVO.getIntegratedSearchKeyword().equals("")) {
			List<BookInfoVO> bookList = bookService.bookSearchIntegratedSelect(bookSearchVO);
			model.addAttribute("bookList", bookList);	
		 }	
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "book/BookList";
	}
	
	@RequestMapping("BookDetailView.do")
	public String bookDetailView(@ModelAttribute("bookSearchVO") BookSearchVO bookSearchVO, ModelMap model, HttpSession session) {
		String returnValue = "";
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		if(userVO != null) {
			String grade = userVO.getGrade();
			if(grade.equals("S")) {
				try {
					BookInfoVO bookDetail = bookService.bookDetailInfoSelect(bookSearchVO);
					model.addAttribute("bookInfoVO", bookDetail);
				 } catch (Exception e) {
					e.printStackTrace();
				 }
				
				returnValue = "book/BookModify";
			}else {
				try {	
					BookInfoVO bookDetail = bookService.bookDetailInfoSelect(bookSearchVO);
					model.addAttribute("bookDetail", bookDetail);
				} catch (Exception e) {
					e.printStackTrace();
				}
				returnValue = "book/BookDetail";
			}
		}else {
			try {	
				BookInfoVO bookDetail = bookService.bookDetailInfoSelect(bookSearchVO);
				model.addAttribute("bookDetail", bookDetail);
			} catch (Exception e) {
				e.printStackTrace();
			}
			returnValue = "book/BookDetail";
		}
		
		return returnValue;
	}
	
	@RequestMapping("BookRegistView.do")
	public String bookRegistView(@ModelAttribute("bookInfoVO") BookInfoVO bookInfoVO, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
	    if(userVO != null) {
		  String grade = userVO.getGrade();
		
		  if(grade.equals("S")) {
		    return "book/BookRegist";
		  }else {
		    return "redirect:/main/UserMain.do";	
		  }
	    }else {
	    	return "redirect:/main/UserMain.do";	
	    }
	}
	
	@RequestMapping("BookRegist.do")
	public String bookRegist(@ModelAttribute("bookInfoVO") BookInfoVO bookInfoVO, HttpSession session, ModelMap model, RedirectAttributes redirectAttributes) {
		boolean result = false;
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		BookSearchVO bookSearchVO = new BookSearchVO();
		int bseq = 0;
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		if(userVO != null) {
			
		  String grade = userVO.getGrade();
		  if(grade.equals("S")) {
			  
			try {
				bookInfoVO.setCreate_user(userVO.getName());
				bookInfoVO.setUpdate_user(userVO.getName());
				map = (HashMap<Object, Object>) bookService.bookInfoInsert(bookInfoVO);
				result = (boolean) map.get("result");
				bseq = (int) map.get("bseq");
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
			bookSearchVO.setBseq(bseq);
			redirectAttributes.addFlashAttribute("bookSearchVO", bookSearchVO);  
			if(result) {
				redirectAttributes.addFlashAttribute("message", "도서 등록 성공하였습니다.");
			}else {
				redirectAttributes.addFlashAttribute("message", "도서 등록 실패하였습니다.");
			} 
			return "redirect:/book/BookModifyView.do";  
		  }else {
			return "redirect:/main/UserMain.do";	 
		  }
		}else {
			return "redirect:/main/UserMain.do";		
		}
		
	}
	
	@RequestMapping("BookModifyView.do")
	public String bookModifyView(@ModelAttribute("bookSearchVO") BookSearchVO bookSearchVO, HttpSession session, ModelMap model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
	    if(userVO != null) {
		  String grade = userVO.getGrade();
		
		  if(grade.equals("S")) {
			 try {
				BookInfoVO bookDetail = bookService.bookDetailInfoSelect(bookSearchVO);
				model.addAttribute("bookInfoVO", bookDetail);
			 } catch (Exception e) {
				e.printStackTrace();
			 }
			
		    return "book/BookModify";
		  }else {
		    return "redirect:/main/UserMain.do";	
		  }
	    }else {
	    	return "redirect:/main/UserMain.do";	
	    }
	}
	
	@RequestMapping("BookModify.do")
	public String bookModify(@ModelAttribute("bookInfoVO") BookInfoVO bookInfoVO, HttpSession session, RedirectAttributes redirectAttributes) {
		boolean result = false;
		BookSearchVO bookSearchVO = new BookSearchVO();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		if(userVO != null) {
			
		  String grade = userVO.getGrade();
		  if(grade.equals("S")) {
			    bookInfoVO.setUpdate_user(userVO.getName());
			    try {
					result = bookService.bookInfoUpdate(bookInfoVO);
				} catch (Exception e) {
					e.printStackTrace();
					result = false;
				}
			    bookSearchVO.setBseq(bookInfoVO.getBseq());
				redirectAttributes.addFlashAttribute("bookSearchVO", bookSearchVO);
			    if(result) {
					redirectAttributes.addFlashAttribute("message", "도서 수정 성공하였습니다.");
				}else {
					redirectAttributes.addFlashAttribute("message", "도서 수정 실패하였습니다.");
				} 
			    return "redirect:/book/BookModifyView.do";  
		  }else {
				return "redirect:/main/UserMain.do";	 
		  }
	    }else {
				return "redirect:/main/UserMain.do";		
		}  
	}
	
	@RequestMapping("BookDelete.do")
	public String bookDelete(@ModelAttribute("bookInfoVO") BookInfoVO bookInfoVO, HttpSession session, RedirectAttributes redirectAttributes) {
		BookSearchVO bookSearchVO = new BookSearchVO();
		String returnValue="";
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		if(userVO != null) {
			
		  String grade = userVO.getGrade();
		  if(grade.equals("S")) {
			  try {   
				  bookService.bookInfoDelete(bookInfoVO);
				  redirectAttributes.addFlashAttribute("message", "도서 삭제 성공하였습니다.");
				  returnValue = "redirect:/book/BookSearchView.do";
			  }catch(Exception e) {
				  bookSearchVO.setBseq(bookInfoVO.getBseq());
				  redirectAttributes.addFlashAttribute("bookSearchVO", bookSearchVO);
				  redirectAttributes.addFlashAttribute("message", "도서 삭제 실패하였습니다.");
				  returnValue = "redirect:/book/BookModifyView.do";
			  }	  
			    return returnValue;  
		  }else {
				return "redirect:/main/UserMain.do";	 
		  }
	    }else {
				return "redirect:/main/UserMain.do";		
		} 		
	}
	
	@RequestMapping("BookLoanReturnView.do")
	public String bookLoanReturnView(HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
	    if(userVO != null) {
	    	String grade = userVO.getGrade();
	    	if(grade.equals("A")) {
	    		return "book/BookLoanReturn";
	    	}else {
	    		return "redirect:/main/UserMain.do";
	    	}
	    	
	    }else {
	    	return "redirect:/main/UserMain.do";	 
	    }
	}
	
	@RequestMapping("BookLoanReturn.do")
	public String bookLoanReturn(@ModelAttribute("bookInfoVO") BookInfoVO bookInfoVO, HttpSession session, ModelMap model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
	    if(userVO != null) {
	    	String grade = userVO.getGrade();
	    	if(grade.equals("A")) {
	    		String result = "대출/반납 실패하였습니다.";
                try {
					result = bookService.bookLoanReturn(bookInfoVO, userVO);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                model.addAttribute("message", result);
	    		return "book/BookLoanReturn";
	    	}else {
	    		return "redirect:/main/UserMain.do";
	    	}
	    	
	    }else {
	    	return "redirect:/main/UserMain.do";	 
	    }
	}
}
