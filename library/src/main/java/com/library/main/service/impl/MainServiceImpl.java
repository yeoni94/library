package com.library.main.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookinfo.vo.BookInfoVO;
import com.library.main.dao.MainMapper;
import com.library.main.service.MainService;

@Service("mainService")
public class MainServiceImpl implements MainService {
    @Autowired
    MainMapper mainMapper;
	
	@Override
	public int inDayCount() throws Exception {
		return mainMapper.inDayCount();
	}

	@Override
	public int outDayCount() throws Exception {
		return mainMapper.outDayCount();
	}

	@Override
	public List<BookInfoVO> newTop6() throws Exception {
		return mainMapper.newTop6();
	}
	
	@Override
	public List<BookInfoVO> borrowTop6() throws Exception {
		return mainMapper.borrowTop6();
	}

	@Override
	public int newDay7Count() throws Exception {
		return mainMapper.newDay7Count();
	}

	@Override
	public int borrowTotalCount() throws Exception {
		return mainMapper.borrowTotalCount();
	}	

}
