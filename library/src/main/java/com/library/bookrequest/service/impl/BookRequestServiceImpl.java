package com.library.bookrequest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookrequest.dao.BookRequestMapper;
import com.library.bookrequest.service.BookRequestService;
import com.library.bookrequest.vo.BookRequestVO;

@Service("bookRequestService")
public class BookRequestServiceImpl implements BookRequestService {
     @Autowired
     BookRequestMapper bookRequestMapper;

	@Override
	public void bookRequestInsert(BookRequestVO bookRequestVO) throws Exception {
		bookRequestMapper.bookRequestInsert(bookRequestVO);
	}

	@Override
	public List<BookRequestVO> bookRequestList(String id) throws Exception {
		return bookRequestMapper.bookRequestList(id);
	}
	
	@Override
	public List<BookRequestVO> bookRequestListAdmin() throws Exception {
		return bookRequestMapper.bookRequestListAdmin();
	}

	@Override
	public void bookRequestApproveOneUpdate(BookRequestVO bookRequestVO) throws Exception {
		bookRequestMapper.bookRequestApproveOneUpdate(bookRequestVO);
	}

	@Override
	public void bookRequestApproveListUpdate(BookRequestVO bookRequestVO) throws Exception {
		bookRequestMapper.bookRequestApproveListUpdate(bookRequestVO);
	}
	
}
