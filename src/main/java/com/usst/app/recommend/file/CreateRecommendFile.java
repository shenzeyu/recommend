package com.usst.app.recommend.file;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.usst.app.customer.service.CustomerService;

public class CreateRecommendFile {
	private CustomerService customerService;
	public void creatRecommendFile(){
		File file = FileUtils.getFile("datafile/job/pv.csv");
//		this.customerService.get
	}
}
