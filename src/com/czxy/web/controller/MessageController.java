package com.czxy.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.domain.Commodity;
import com.czxy.domain.Message;
import com.czxy.domain.MessageVo;
import com.czxy.domain.MsgVo;
import com.czxy.domain.User;
import com.czxy.service.CommodityService;
import com.czxy.service.MessageService;
import com.czxy.service.Impl.MessageServiceImpl;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Resource
	private MessageService messageService;
	
	@Resource
	private CommodityService commodityService;

	@RequestMapping("/addMessage.apx")
	public @ResponseBody MsgVo addMessage(Message msg, HttpServletRequest request){
//		System.out.println(msg.getCommodityId());
		try {
		System.out.println(msg);
			User user = (User)request.getSession().getAttribute("loginUser");
			Commodity commodity = commodityService.findByCid(msg.getCommodityId());
			msg.setSendUid(user.getUid());
			msg.setReceiveUid(commodity.getUid());
			msg.setSendTime(new Date());
			messageService.insert(msg);
		} catch (Exception e) {
			return new MsgVo("发送失败", "false");
		}
		return new MsgVo("发送成功", "true");
	}
	@RequestMapping("/addMessage2.apx")
	public @ResponseBody MsgVo addMessage2(@RequestBody Message msg, HttpServletRequest request){
//		System.out.println(msg.getCommodityId());
		try {
//		System.out.println(msg);
		User user = (User)request.getSession().getAttribute("loginUser");
//		Commodity commodity = commodityService.findByCid(msg.getCommodityId());
		msg.setSendUid(user.getUid());
		if(msg.getReceiveUid()==null){
			msg.setReceiveUid(messageService.selectByMid(msg.getFatherMid()).getSendUid());
		}
		msg.setSendTime(new Date());
//		System.out.println(msg);
		messageService.insert(msg);
		} catch (Exception e) {
			return new MsgVo("发送失败", "false");
		}
		return new MsgVo("发送成功", "true");
	}
	
	/**
	 * 我发送的留言
	 * @param request
	 * @return
	 */
	@RequestMapping("/published.apx")
	public @ResponseBody List<MessageVo> published(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("loginUser");
		List<Message> selectBySendUser = messageService.selectBySendUser(user.getUid());
		List<MessageVo> list = new ArrayList<MessageVo>();
		for (Message message : selectBySendUser) {
			list.add(new MessageVo(message));
		}
		return list;
	}
	
	/**
	 * 我收到的留言
	 * @param request
	 * @return
	 */
	@RequestMapping("/received.apx")
	public @ResponseBody List<MessageVo> received(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("loginUser");
		List<Message> selectBySendUser = messageService.selectByReceiveUser(user.getUid());
		List<MessageVo> list = new ArrayList<MessageVo>();
		for (Message message : selectBySendUser) {
			list.add(new MessageVo(message));
		}
		return list;
	}
	
}
