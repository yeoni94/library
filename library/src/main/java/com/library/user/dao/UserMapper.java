package com.library.user.dao;

import java.util.HashMap;
import java.util.List;

import com.library.user.vo.UserVO;

public interface UserMapper {

	public int loginCheck(UserVO userVO) throws Exception;

    public UserVO getUser(UserVO userVO) throws Exception;
    
    public String userIdPwCheck(UserVO userVO) throws Exception;
    
    public void userPwUpdate(UserVO userVO) throws Exception;
    
    public int userIdExistCnt(String id) throws Exception;
    
    public void userInsert(UserVO userVO) throws Exception;
    
    public List<UserVO> selectUserB() throws Exception;
    
    public void updateUserA(int useq) throws Exception;
    
    public void updatePenalty(HashMap<Object, Object> map) throws Exception;
    
    public int selectUserPenalty(String id) throws Exception;
    
    public UserVO selectUserDetail(String id) throws Exception;
    
    public void updateUserDetail(UserVO userVO) throws Exception;
    
    public void deleteUser(UserVO userVO) throws Exception;
}
