package com.usst.app.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.usst.app.test.model.User;

@Controller
@RequestMapping("/test/*")
public class TestController {
	@RequestMapping("save")
	public void test(@RequestParam("name")String name){
		System.out.println(name);
	}
//	@RequestMapping("ld")
	public void testLD(HttpServletResponse response,String s){
		List<String> list = new ArrayList<String>();
		System.out.println(s);
		if(s.equals("1")){
			for(int i=0;i<10;i++){
				list.add(i+"");
			}
		}
		try {
			PrintWriter pw = response.getWriter();
			pw.write(JSON.toJSONString(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping("ld")
	@ResponseBody
	public List<String> testLDGo(String s){
		List<String> list = new ArrayList<String>();
		System.out.println("ld"+s);
		if(s.equals("1")){
			for(int i=0;i<10;i++){
				list.add(i+"");
			}
		}
		return list;
	}
	@RequestMapping("form")
	@ResponseBody
//	User user
	public String testForm(String s,String name,String address){
//		System.out.println(user.getS()+" "+user.getName()+"|"+user.getAddress());
		System.out.println(s+" "+name+"|"+address);
		Map<String,String> map = new HashMap<String,String>();
		return "success";
	}
}


