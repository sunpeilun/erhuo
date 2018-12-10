package com.czxy.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.czxy.service.Impl.MessageServiceImpl;

public class MessageVo {

	private Integer mid;
	private Integer sendUid; //发送用户id
	private Integer receiveUid; //接收用户Id
	private String commodityId; //商品Id
	private String text; //消息文本
	private String sendTime; //发送时间
	
	private User sendUser;
	
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getSendUid() {
		return sendUid;
	}
	public void setSendUid(Integer sendUid) {
		this.sendUid = sendUid;
	}
	public Integer getReceiveUid() {
		return receiveUid;
	}
	public void setReceiveUid(Integer receiveUid) {
		this.receiveUid = receiveUid;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public MessageVo(Integer mid, Integer sendUid, Integer receiveUid, String commodityId, String text,
			String sendTime) {
		super();
		this.mid = mid;
		this.sendUid = sendUid;
		this.receiveUid = receiveUid;
		this.commodityId = commodityId;
		this.text = text;
		this.sendTime = sendTime;
	}
	
	
	
	public MessageVo(Message m) {
		super();
		this.mid = m.getMid();
		this.sendUid = m.getSendUid();
		this.receiveUid = m.getReceiveUid();
		this.commodityId = m.getCommodityId();
		this.text = m.getText();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.sendTime = dateFormat.format(m.getSendTime());
		this.sendUser = m.getSendUser();
		
		
	}
	
	
	

	public MessageVo() {
		super();
	}
	public User getSendUser() {
		return sendUser;
	}
	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}
	
	
}
