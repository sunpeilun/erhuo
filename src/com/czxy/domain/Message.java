package com.czxy.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.czxy.service.Impl.MessageServiceImpl;

public class Message {

	/*
	 * 
	CREATE TABLE `message` (
	  `mid` int(11) NOT NULL AUTO_INCREMENT,
	  `send_uid` int(11) DEFAULT NULL,
	  `receive_uid` int(11) DEFAULT NULL,
	  `commodity_id` varchar(32) DEFAULT NULL,
	  `text` varchar(40) DEFAULT NULL,
	  `send_time` datetime DEFAULT NULL,
	  PRIMARY KEY (`mid`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8

	 * */
	
	private Integer mid;
	@Override
	public String toString() {
		return "Message [mid=" + mid + ", sendUid=" + sendUid + ", receiveUid=" + receiveUid + ", commodityId="
				+ commodityId + ", text=" + text + ", sendTime=" + sendTime + ", fatherMid=" + fatherMid + ", level="
				+ level + ", sendUser=" + sendUser + ", receiveUser=" + receiveUser + ", reviews=" + reviews + "]";
	}

	private Integer sendUid; //发送用户id
	private Integer receiveUid; //接收用户Id
	private String commodityId; //商品Id
	private String text; //消息文本
	private Date sendTime; //发送时间
	private Integer fatherMid;
	private Integer level;
	private User sendUser;
	private User receiveUser;
	
	
	
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public User getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(User receiveUser) {
		this.receiveUser = receiveUser;
	}

	private List<Message> reviews = new ArrayList<>() ;

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

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Integer getFatherMid() {
		return fatherMid;
	}

	public void setFatherMid(Integer fatherMid) {
		this.fatherMid = fatherMid;
	}

	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	public List<Message> getReviews() {
		return reviews;
	}

	public void setReviews(List<Message> reviews) {
		this.reviews = reviews;
	}

	
	
	
	
	
	
}
