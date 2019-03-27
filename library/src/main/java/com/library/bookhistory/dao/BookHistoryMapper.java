package com.library.bookhistory.dao;

import java.util.HashMap;
import java.util.List;

import com.library.bookhistory.vo.BookHistoryVO;

public interface BookHistoryMapper {

	public int historyCheckCnt(HashMap<String, String> map) throws Exception;
	
	public void returnUpdate(HashMap<String, String> map) throws Exception;
	
	public int penaltySelect(HashMap<String, String> map) throws Exception;
	
	public void loanInsert(HashMap<String, String> map) throws Exception;
	
	public List<BookHistoryVO> bookHistorySelect(String id) throws Exception;
	
}
