package com.czxy.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.MessageMapper;
import com.czxy.domain.Message;
import com.czxy.service.MessageService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

	@Resource
	private MessageMapper messageMapper;

	@Override
	public void insert(Message m) {
		messageMapper.insert(m);
	}

	@Override
	public void delete(Integer mid) {
		messageMapper.deleteByPrimaryKey(mid);

	}

	@Override
	@Transactional(readOnly = true) // 只读
	public List<Message> selectBySendUser(Integer uid) {
		return messageMapper.selectBySendUser(uid);
	}

	@Override
	@Transactional(readOnly = true) // 只读
	public List<Message> selectByReceiveUser(Integer uid) {
		return messageMapper.selectByReceiveUser(uid);
	}

	@Override
	@Transactional(readOnly = true) // 只读
	public List<Message> selectByCommodity(String cid) {
		return messageMapper.selectByCommodity(cid);
	}

	@Override
	@Transactional(readOnly = true) // 只读
	public List<Message> selectByFatherMid(Integer mid) {
		// TODO Auto-generated method stub
		return messageMapper.selectByFatherMid(mid);
	}

	@Override
	public Message selectByMid(Integer mid) {
		// TODO Auto-generated method stub
		return messageMapper.selectByMid(mid);
	}

}
