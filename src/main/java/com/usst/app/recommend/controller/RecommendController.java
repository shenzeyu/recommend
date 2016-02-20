package com.usst.app.recommend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.usst.app.recommend.model.Recommend;
import com.usst.app.recommend.service.RecommendService;

@Controller
@RequestMapping("/*")
public class RecommendController {
	RecommendService recommendService;
	@RequestMapping("pingjia")
	public String pingjia(HttpServletRequest request,@RequestParam("uid") String uid,@RequestParam("goodId") String goodId ,@RequestParam("iid") String iid,Model model){
		model.addAttribute("goodId", goodId);
		model.addAttribute("uid", uid);
		model.addAttribute("iid",iid);
		return "front/guanwang/pingjia";
	}
	@RequestMapping("saveRecommend")
	public void saveRecommend(Recommend recommend){
		recommendService.insertRecommend(recommend);
	}
	@Autowired
	public void setRecommendService(RecommendService recommendService) {
		this.recommendService = recommendService;
	}
	
}
