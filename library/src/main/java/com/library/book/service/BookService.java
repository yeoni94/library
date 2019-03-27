package com.library.book.service;

import java.util.List;
import java.util.Map;

import com.library.bookinfo.vo.BookInfoVO;
import com.library.bookinfo.vo.BookSearchVO;
import com.library.user.vo.UserVO;

public interface BookService {

	List<BookInfoVO> bookSearchDetailSelect(BookSearchVO bookSearchVO) throws Exception;
	
	List<BookInfoVO> bookSearchIntegratedSelect(BookSearchVO bookSearchVO) throws Exception;
	
	BookInfoVO bookDetailInfoSelect(BookSearchVO bookSearchVO) throws Exception;
	
	public  Map<Object, Object> bookInfoInsert(BookInfoVO bookInfoVO) throws Exception;
	
	public boolean bookInfoUpdate(BookInfoVO bookInfoVO) throws Exception;
	
	public void bookInfoDelete(BookInfoVO bookInfoVO) throws Exception;
	
	public String bookLoanReturn(BookInfoVO bookInfoVO, UserVO userVO) throws Exception;
	
}
