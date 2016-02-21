package com.usst.recommend;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestBean {
	public void testFile(){
		try {
			List<String> list = FileUtils.readLines(new File(""));
			System.out.println(list.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		Product p = (Product) ac.getBean("product");
		System.out.println(p.getClass());
		System.out.println(p.getName()+":"+p.getAliasName());
	}
	
}
class Product {
	private String name;
	private String aliasName;
	public void setName(String name) {
		this.name = name;
	}
	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}
	public String getName() {
		return name;
	}
	public String getAliasName() {
		return aliasName;
	}
	
}

