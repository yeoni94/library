package com.library.user.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.bookhistory.vo.BookHistoryVO;
import com.library.user.service.UserService;
import com.library.user.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {
    
	@Resource(name="userService")
	UserService userService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/UserLogin";
	}
	
	@RequestMapping("loginCheck.do")
	public String loginCheck(@ModelAttribute("userVO") UserVO userVO, ModelMap model, HttpSession session, RedirectAttributes redirectAttributes) {
            boolean result = false;
            String returnValue = null;
			try {
				result = userService.loginCheck(userVO, session);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(result) {
				returnValue="redirect:/main/UserMain.do";
			}else {
				redirectAttributes.addFlashAttribute("message", "로그인 실패 하였습니다. 아이디 및 비밀번호를 확인하세요.");
				returnValue="redirect:/user/login.do";
			}
		
		return returnValue;
	}
	
	@RequestMapping("logout.do")
	public String logout(ModelMap model, HttpSession session) {
		userService.loggout(session);
		return "redirect:/main/UserMain.do";
	}
	
	@RequestMapping("UserIdPw.do")
	public String userIdPw() {
		return "user/UserIdPw";
	}
	
	@RequestMapping("UserIdPwCheck.do")
	public String userIdPwCheck(@ModelAttribute("userVO") UserVO userVO, ModelMap model) {
		boolean result = false;
		try {
			result = userService.userIdPwCheck(userVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == true) {
		  model.addAttribute("result", "true");	
		  model.addAttribute("email", userVO.getEmail());
		}else {
		  model.addAttribute("result", "false");	
		}
		return "user/UserIdPwResult";
	}
	
	@RequestMapping("UserRegistView.do")
	public String userRegistView() {
		return "user/UserRegist";
	}
	
	@RequestMapping("UserIdExistCnt.do")
	@ResponseBody
	public Map<Object, Object> userIdExistCnt(@RequestBody String id) {
		int cnt = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			cnt = userService.userIdExistCnt(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("cnt", cnt);
		return map;
	}
	
	
	@RequestMapping("UserRegist.do")
	public String userRegist(@ModelAttribute("userVO") UserVO userVO, RedirectAttributes redirectAttributes) {
		String returnValue = null;
		try {
			userService.userInsert(userVO);
			redirectAttributes.addFlashAttribute("message", "회원가입 성공하였습니다.");
			returnValue = "redirect:/user/login.do";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "회원가입 실패하였습니다.");
			returnValue = "redirect:/user/UserRegistView.do";
			e.printStackTrace();
		}
		return returnValue;
	}
	
	@RequestMapping("UserRegistApproveView.do")
	public String userRegistApproveView(HttpSession session, ModelMap model) {
        UserVO userVO = (UserVO) session.getAttribute("userVO");
	    List<UserVO> list = null;
		if(userVO != null) {	
		  String grade = userVO.getGrade();
		  if(grade.equals("S")) {
				try {
					list = userService.selectUserB();
				} catch (Exception e) {
					e.printStackTrace();
				}
			    model.addAttribute("UserBList", list);
			    return "user/UserRegistApprove";
		  }else {
				return "redirect:/main/UserMain.do";	 
		  }
		}else {
			   return "redirect:/main/UserMain.do";
		}
	}
	
	@RequestMapping("UserRegistApprove.do")
	public String userRegistApprove(@ModelAttribute("userVO") UserVO userVO, HttpSession session, ModelMap model) {
        UserVO sessionUserVO = (UserVO) session.getAttribute("userVO");
		if(sessionUserVO != null) {	
		  String grade = sessionUserVO.getGrade();
		  if(grade.equals("S")) {
			if(userVO.getUserVOList() != null) {
			  try {
				  for(UserVO user : userVO.getUserVOList()) {
					if(user.getRegistApprove() != null && user.getRegistApprove().equals("Y")) {
					  userService.updateUserA(user);
					}
				  }
				  model.addAttribute("message", "가입 승인 성공하였습니다.");
			  }catch (Exception e) {
				  e.printStackTrace();
				  model.addAttribute("message", "가입 승인 실패하였습니다."); 
			  }
			}
			    return "forward:/user/UserRegistApproveView.do";
		  }else {
				return "redirect:/main/UserMain.do";	 
		  }
		}else {
			   return "redirect:/main/UserMain.do";
		}
	}
	
	@RequestMapping("UserModifyView.do")
	public String userModifyView(HttpSession session, ModelMap model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
	    if(userVO != null) {
	    	String grade = userVO.getGrade();
	    	if(grade.equals("A")) {
	    		try {
	    			UserVO user = userService.selectUserDetail(userVO.getId());
					model.addAttribute("user", user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		return "user/UserModify";
	    	}else {
	    		return "redirect:/main/UserMain.do";
	    	}
	    	
	    }else {
	    	return "redirect:/main/UserMain.do";	 
	    }		
	}
	
	@RequestMapping("UserModify.do")
	public String userModify(@ModelAttribute("userVO") UserVO userVO, HttpSession session, ModelMap model) {
		UserVO sessionUserVO = (UserVO) session.getAttribute("userVO");
	    if(sessionUserVO != null) {
	    	String grade = sessionUserVO.getGrade();
	    	if(grade.equals("A")) {
	    		try {
					userService.updateUserDetail(userVO);
					model.addAttribute("message", "수정 성공하였습니다.");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					model.addAttribute("message", "수정 실패하였습니다.");
				}
	    		return "forward:/user/UserModifyView.do";
	    	}else {
	    		return "redirect:/main/UserMain.do";
	    	}
	    	
	    }else {
	    	return "redirect:/main/UserMain.do";	 
	    }		
	}
	
	@RequestMapping("UserDelete.do")
	public String userDelete(@ModelAttribute("userVO") UserVO userVO, HttpSession session, ModelMap model) {
		UserVO sessionUserVO = (UserVO) session.getAttribute("userVO");
	    if(sessionUserVO != null) {
	    	String grade = sessionUserVO.getGrade();
	    	if(grade.equals("A")) {
	    		String returnValue = "";
	    		try {
					userService.deleteUser(userVO);
					model.addAttribute("message", "회원 탈퇴 되었습니다.");
					userService.loggout(session);
					returnValue = "forward:/main/UserMain.do";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					model.addAttribute("message", "회원 탈퇴 실패하였습니다.");
					returnValue = "forward:/user/UserModifyView.do";
				}
	    		return returnValue;
	    	}else {
	    		return "redirect:/main/UserMain.do";
	    	}
	    	
	    }else {
	    	return "redirect:/main/UserMain.do";	 
	    }		
	}	
}
