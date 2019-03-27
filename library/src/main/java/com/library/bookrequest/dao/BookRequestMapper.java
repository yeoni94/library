package com.library.bookrequest.dao;

import java.util.List;

import com.library.bookrequest.vo.BookRequestVO;

public interface BookRequestMapper {
	
    public void bookRequestInsert(BookRequestVO bookRequestVO) throws Exception;
    
    public List<BookRequestVO> bookRequestList(String id) throws Exception;
    
    public List<BookRequestVO> bookRequestListAdmin() throws Exception;
    
    public void bookRequestApproveOneUpdate(BookRequestVO bookRequestVO) throws Exception;
    
    public void bookRequestApproveListUpdate(BookRequestVO bookRequestVO) throws Exception;
}
