package com.czxy.service;

import java.util.List;

import com.czxy.domain.Message;

public interface MessageService {

	void insert(Message m);
	
	void delete(Integer mid);
	
	List<Message> selectBySendUser(Integer uid);
	
	List<Message> selectByReceiveUser(Integer uid);
	
	List<Message> selectByCommodity(String cid);
	List<Message> selectByFatherMid(Integer mid);
	Message selectByMid(Integer mid);
	
	
}
