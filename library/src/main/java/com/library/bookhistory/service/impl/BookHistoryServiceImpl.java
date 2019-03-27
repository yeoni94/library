package com.library.bookhistory.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhistory.dao.BookHistoryMapper;
import com.library.bookhistory.service.BookHistoryService;
import com.library.bookhistory.vo.BookHistoryVO;

@Service("bookHistoryService")
public class BookHistoryServiceImpl implements BookHistoryService{
	@Autowired
	BookHistoryMapper bookHistoryMapper;

	@Override
	public List<BookHistoryVO> bookHistorySelect(String id) throws Exception {
		return bookHistoryMapper.bookHistorySelect(id);
	}
}
