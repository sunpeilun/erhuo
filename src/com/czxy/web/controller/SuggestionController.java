package com.czxy.web.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.czxy.domain.MsgVo;
import com.czxy.domain.User;
import com.czxy.domain.UserSuggest;
import com.czxy.service.SuggestService;
import com.czxy.utils.MyJsonUtils;

@Controller
@RequestMapping("/regis")
public class SuggestionController {	
	@Resource
	private SuggestService service;
	
	
@RequestMapping("sugg.apx")
public void run(@RequestParam(required=true)String content,HttpServletRequest request,HttpServletResponse response) throws Exception{
	try {
		//获取用户session，取得用户id
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		User user = (User)request.getSession().getAttribute("loginUser");
		int uid=user.getUid();
		//获得从页面传来的反馈信息，并赋值
		String suggest=content;
		UserSuggest sug=new UserSuggest(uid,suggest);
		//反馈信息存入数据库，并向页面响应结果
		service.insert(sug);
		String msg = MyJsonUtils.getJsonString(new MsgVo("反馈成功！", "true"));
		response.getWriter().print(msg);
	} catch (Exception e) {
		//发生异常，反馈异常信息
		String msg = MyJsonUtils.getJsonString(new MsgVo("反馈失败，请重试！", "false"));
		response.getWriter().print(msg);
	}
	
	
}
	


}
