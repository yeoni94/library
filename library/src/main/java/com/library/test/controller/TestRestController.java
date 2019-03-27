package com.library.test.controller;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.test.service.TestService;

@RestController
public class TestRestController {
    @Resource(name="testService")
    TestService testService;
    
    @RequestMapping("/hello")
    public @ResponseBody String root_test() throws Exception{
    	return "Hello World!";
    }
    
    @RequestMapping("/now")
    public @ResponseBody String now() throws Exception{
    	return testService.getDual();
    }
}
