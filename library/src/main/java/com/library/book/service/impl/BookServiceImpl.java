package com.library.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.book.dao.BookMapper;
import com.library.book.service.BookService;
import com.library.bookhistory.dao.BookHistoryMapper;
import com.library.bookinfo.vo.BookInfoVO;
import com.library.bookinfo.vo.BookSearchVO;
import com.library.user.dao.UserMapper;
import com.library.user.vo.UserVO;
import com.library.util.FileGenerator;

@Service("bookService")
public class BookServiceImpl implements BookService{

	@Autowired
	BookMapper bookMapper;
	
	@Autowired
	BookHistoryMapper bookHistoryMapper;
	
	@Autowired
	UserMapper userMapper;

	@Override
	public List<BookInfoVO> bookSearchDetailSelect(BookSearchVO bookSearchVO) throws Exception {
		return bookMapper.bookSearchDetailSelect(bookSearchVO);
	}

	@Override
	public List<BookInfoVO> bookSearchIntegratedSelect(BookSearchVO bookSearchVO) throws Exception {
		return bookMapper.bookSearchIntegratedSelect(bookSearchVO);
	}

	@Override
	public BookInfoVO bookDetailInfoSelect(BookSearchVO bookSearchVO) throws Exception {
		return bookMapper.bookDetailInfoSelect(bookSearchVO);
	}

	@Override
	public Map<Object, Object> bookInfoInsert(BookInfoVO bookInfoVO) throws Exception {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean result = false;
		int bseq = 0;
		String image = "";
		Date now = new Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyyymmddhhmmss");
		if(bookInfoVO.getType().equals("도서")) {
		  image = "B_"+dt.format(now);
		}else if(bookInfoVO.getType().equals("비도서")) {
		  image = "N_"+dt.format(now);	
		}
	    result = FileGenerator.saveBookImg(bookInfoVO.getFile(), image);
		try {
		    if(result) {
			  bookInfoVO.setImage(image);
			  bookMapper.bookInfoInsert(bookInfoVO);
			  bseq = bookInfoVO.getBseq();
			}
		}catch(Exception e) {
			result = false;
			FileGenerator.deleteBookImg(image);
		}
		map.put("result", result);
		map.put("bseq", bseq);
	    return map;	
	}
	
	@Override
	public boolean bookInfoUpdate(BookInfoVO bookInfoVO) throws Exception {
		boolean result = true;
		String image = "";
		Date now = new Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyyymmddhhmmss");
		
		if(!bookInfoVO.getFile().isEmpty()) {
			String name = bookMapper.bookInfoImg(bookInfoVO);
			FileGenerator.deleteBookImg(name);
			
			if(bookInfoVO.getType().equals("도서")) {
				  image = "B_"+dt.format(now);
			}else if(bookInfoVO.getType().equals("비도서")) {
				  image = "N_"+dt.format(now);	
			}
			    result = FileGenerator.saveBookImg(bookInfoVO.getFile(), image);	
		}
		
		if(result) {
		  if(!bookInfoVO.getFile().isEmpty()) {	
		    bookInfoVO.setImage(image);
		  }
		  bookMapper.bookInfoUpdate(bookInfoVO);
		}	
	    return result;	
	}

	@Override
	public void bookInfoDelete(BookInfoVO bookInfoVO) throws Exception {
		String name = bookMapper.bookInfoImg(bookInfoVO);
		FileGenerator.deleteBookImg(name);
		bookMapper.bookInfoDelete(bookInfoVO);
	}

	//n 반납해야 함
	//y 대출 가능
	@Override
	public String bookLoanReturn(BookInfoVO bookInfoVO, UserVO userVO) throws Exception {
		String result = "";
		String state = bookMapper.bookStateSelect(bookInfoVO);
		//반납 해야 할 도서면 해당 도서가 해당 이용자가 대출한 도서인지 확인
		if(state.equals("N")) {
		
		  HashMap<String, String> map = new HashMap<String, String>();
		  map.put("id", userVO.getId());
		  map.put("bnum", bookInfoVO.getBnum());
		  int cnt = bookHistoryMapper.historyCheckCnt(map);
		  //반납해라
		  if(cnt > 0) {
			int penalty = bookHistoryMapper.penaltySelect(map);  
			//도서 상태 업데이트
			bookMapper.bookStateUpdateY(bookInfoVO);
			//대출 반납 이력 업데이트
			bookHistoryMapper.returnUpdate(map);
			//패털티 업데이트  
			if(penalty > 0) {
			  HashMap<Object, Object> penaltyMap = new HashMap<Object, Object>();
			  penaltyMap.put("penalty", penalty);
			  penaltyMap.put("useq", userVO.getUseq());
		      userMapper.updatePenalty(penaltyMap);
			}
			
			result="반납 되었습니다.";  
		  }else {
		    result=userVO.getName()+"님이 대출한 도서가 아닙니다. 대출한 도서는 본인만 반납 가능합니다.";
		  }
		//대출 해야 할 도서면 해당 이용자가 대출 가능한 이용자인지 확인  
		}else if(state.equals("Y")) {
			HashMap<String, String> map = new HashMap<String, String>();
			  map.put("id", userVO.getId());
			  map.put("bnum", bookInfoVO.getBnum());
		    int userPenalty = userMapper.selectUserPenalty(userVO.getId());
		    //대출 가능
		    if(userPenalty == 0) {
		      //도서 상태 업데이트  
		      bookMapper.bookStateUpdateN(bookInfoVO);
		      //대출 반납 이력 업데이트
		      bookHistoryMapper.loanInsert(map);
		      result="대출되었습니다.";
		    //대출 불가능	 
		    }else {
		      result="연체일이 있어 대출이 불가합니다. 연체일: "+userPenalty;	 
		    }
		// 없는 도서 번호	
		}else {
		  result = "존재하지 않는 도서 번호 입니다. 도서 번호를 확인하세요.";
		}
		return result;
	}
	
}
