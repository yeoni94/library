package com.library.main.service;

import java.util.List;

import com.library.bookinfo.vo.BookInfoVO;

public interface MainService {
	
    int inDayCount() throws Exception;
    
    int outDayCount() throws Exception;
    
    List<BookInfoVO> newTop6() throws Exception;
    
    List<BookInfoVO> borrowTop6() throws Exception;
    
	int newDay7Count() throws Exception;
	
	int borrowTotalCount() throws Exception;
}
