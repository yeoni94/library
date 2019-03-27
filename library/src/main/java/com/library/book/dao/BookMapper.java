package com.library.book.dao;

import java.util.List;

import com.library.bookinfo.vo.BookInfoVO;
import com.library.bookinfo.vo.BookSearchVO;

public interface BookMapper {

	public List<BookInfoVO> bookSearchDetailSelect(BookSearchVO bookSearchVO) throws Exception;
	
	public List<BookInfoVO> bookSearchIntegratedSelect(BookSearchVO bookSearchVO) throws Exception;
	
	public BookInfoVO bookDetailInfoSelect(BookSearchVO bookSearchVO) throws Exception;
	
	public int bookInfoInsert(BookInfoVO bookInfoVO) throws Exception;
	
	public void bookInfoUpdate(BookInfoVO bookInfoVO) throws Exception;
	
	public void bookInfoDelete(BookInfoVO bookInfoVO) throws Exception;
	
	public String bookInfoImg(BookInfoVO bookInfoVO) throws Exception;

	public String bookStateSelect(BookInfoVO bookInfoVO) throws Exception;
	
	public void bookStateUpdateY(BookInfoVO bookInfoVO) throws Exception;
	
	public void bookStateUpdateN(BookInfoVO bookInfoVO) throws Exception;
}
