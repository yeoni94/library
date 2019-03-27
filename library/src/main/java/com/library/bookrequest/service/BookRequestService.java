package com.library.bookrequest.service;

import java.util.List;

import com.library.bookrequest.vo.BookRequestVO;

public interface BookRequestService {

	void bookRequestInsert(BookRequestVO bookRequestVO) throws Exception;
	
	List<BookRequestVO> bookRequestList(String id) throws Exception;
	
	List<BookRequestVO> bookRequestListAdmin() throws Exception;
	
	void bookRequestApproveOneUpdate(BookRequestVO bookRequestVO) throws Exception;
	
	void bookRequestApproveListUpdate(BookRequestVO bookRequestVO) throws Exception;
}
