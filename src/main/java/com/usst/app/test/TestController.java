package com.usst.app.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test/*")
public class TestController {
	@RequestMapping("save")
	public void test(@RequestParam("name")String name){
		System.out.println(name);
	}
}
