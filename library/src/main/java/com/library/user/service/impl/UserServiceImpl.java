package com.library.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.library.user.dao.UserMapper;
import com.library.user.service.UserService;
import com.library.user.vo.UserVO;
import com.library.util.passwordGenerator;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Autowired 
	private JavaMailSender emailSender;
	
	@Override
	public boolean loginCheck(UserVO userVO, HttpSession session) throws Exception {
        int cnt = userMapper.loginCheck(userVO);
        boolean result = false;
		if(cnt > 0) {
			result = true;
			UserVO userVO2 = userMapper.getUser(userVO);
			session.setAttribute("userVO", userVO2);
		}
		return result;
	}
	
	
	@Override
	public void loggout(HttpSession session) {
		session.invalidate();
	}


	@Override
	public boolean userIdPwCheck(UserVO userVO) throws Exception {
		boolean result = false;
		String id = userMapper.userIdPwCheck(userVO);
		if (id != null) {
		  String pw = passwordGenerator.getRandomPassword(8);
		  userVO.setPw(pw);
		  userMapper.userPwUpdate(userVO);
		  String to = userVO.getEmail();
		  String subject = "my little library 아이디/비밀번호  발송";
		  String text = "안녕하세요. my little library의 관리자입니다.\n"
				        +"귀하의 ID와 PW는 다음과 같습니다.\n"
				        +"ID:"+id+"\n"
				        +"PW:"+pw; 
		  SimpleMailMessage msg = new SimpleMailMessage();
          msg.setTo(to);
          msg.setSubject(subject);
          msg.setText(text);
          emailSender.send(msg);
		  result = true;
		}
		return result;
	}


	@Override
	public int userIdExistCnt(String id) throws Exception {
		return userMapper.userIdExistCnt(id);
	}


	@Override
	public void userInsert(UserVO userVO) throws Exception {
		userMapper.userInsert(userVO);
	}


	@Override
	public List<UserVO> selectUserB() throws Exception {
		return userMapper.selectUserB();
	}


	@Override
	public void updateUserA(UserVO userVO) throws Exception {
		userMapper.updateUserA(userVO.getUseq());
	}


	@Override
	public UserVO selectUserDetail(String id) throws Exception {
		return userMapper.selectUserDetail(id);
	}


	@Override
	public void updateUserDetail(UserVO userVO) throws Exception {
		userMapper.updateUserDetail(userVO);
	}


	@Override
	public void deleteUser(UserVO userVO) throws Exception {
		userMapper.deleteUser(userVO);
	}
}
