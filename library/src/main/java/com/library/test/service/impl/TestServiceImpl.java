package com.library.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.test.dao.TestMapper;
import com.library.test.service.TestService;

@Service("testService")
public class TestServiceImpl implements TestService{
	@Autowired
	TestMapper testMapper;
	
	/* select dual */
	public String getDual() throws Exception{
       return testMapper.getDual();		
	}
}
