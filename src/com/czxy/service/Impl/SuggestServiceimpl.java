package com.czxy.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.UserSuggestMapper;
import com.czxy.domain.UserSuggest;
import com.czxy.service.SuggestService;
@Service
@Transactional
public class SuggestServiceimpl implements SuggestService {
	@Resource
private UserSuggestMapper mapper;
	@Override
	public void insert(UserSuggest gst) {
		mapper.insert(gst);
	}

}
