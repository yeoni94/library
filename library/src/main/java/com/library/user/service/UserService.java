package com.library.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.library.user.vo.UserVO;

public interface UserService {
     public boolean loginCheck(UserVO userVO, HttpSession session) throws Exception;
     
     public void loggout(HttpSession session);
     
     public boolean userIdPwCheck(UserVO userVO) throws Exception;
     
     public int userIdExistCnt(String id) throws Exception;
     
     public void userInsert(UserVO userVO) throws Exception;
     
     public List<UserVO> selectUserB() throws Exception;
     
     public void updateUserA(UserVO userVO) throws Exception;
     
     public UserVO selectUserDetail(String id) throws Exception;
     
     public void updateUserDetail(UserVO userVO) throws Exception;
     
     public void deleteUser(UserVO userVO) throws Exception;
}
