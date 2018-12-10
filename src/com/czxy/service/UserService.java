package com.czxy.service;

import com.czxy.domain.User;

public interface UserService {

	User login(User user);
	
	void register(User user);

	User findUser(String parameter);

	void updateUser(User user);

	User selectUserById(Integer uid);

}
