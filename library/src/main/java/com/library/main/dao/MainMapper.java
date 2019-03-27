package com.library.main.dao;

import java.util.List;

import com.library.bookinfo.vo.BookInfoVO;

public interface MainMapper {

	public int inDayCount() throws Exception;
	
	public int outDayCount() throws Exception;

	public List<BookInfoVO> newTop6() throws Exception;
	
	public List<BookInfoVO> borrowTop6() throws Exception;
	
	public int newDay7Count() throws Exception;
	
	public int borrowTotalCount() throws Exception;
}
