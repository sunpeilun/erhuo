package com.czxy.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.UserMapper;
import com.czxy.domain.User;
import com.czxy.service.UserService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;

	@Override
	@Transactional(readOnly=true) //只读
	public User login(User user) {
		Example e = new Example(User.class);
		Criteria cc = e.createCriteria();
		cc.andEqualTo("userName", user.getUserName());
		cc.andEqualTo("password", user.getPassword());
		return userMapper.selectOneByExample(e);
	}
    //用户添加至数据库
	@Override
	public void register(User user) {
		userMapper.insert(user);
	}
	@Override
	@Transactional(readOnly=true) //只读	
	public User findUser(String parameter) {
		Example ex=new Example(User.class);
		Example.Criteria cr = ex.createCriteria();
		cr.andEqualTo("userName",parameter);
		return userMapper.selectOneByExample(ex);
	}
	
	/**
	 * 更新用户信息
	 */
	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKey(user);
	}
	
	/**
	 * 通过Id查询user
	 */
	@Override
	@Transactional(readOnly=true) //只读
	public User selectUserById(Integer uid) {
		return userMapper.selectByPrimaryKey(uid);
	}
}
