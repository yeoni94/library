package com.library.bookhistory.service;

import java.util.List;

import com.library.bookhistory.vo.BookHistoryVO;

public interface BookHistoryService {
	
	List<BookHistoryVO> bookHistorySelect(String id) throws Exception;
}
