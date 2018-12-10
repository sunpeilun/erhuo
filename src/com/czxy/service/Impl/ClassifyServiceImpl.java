package com.czxy.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.ClassifyMapper;
import com.czxy.domain.Classify;
import com.czxy.service.ClassifyService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class ClassifyServiceImpl implements ClassifyService {

	@Resource
	private ClassifyMapper classifyMapper;

	@Override
	@Transactional(readOnly = true)
	public List<Classify> selectAll() {
		return classifyMapper.selectAll();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Classify> selectByName(String classificationName) {
		Example e = new Example(Classify.class);
		Criteria cc = e.createCriteria();
		cc.andLike("classificationName", "%" + classificationName + "%");
		return classifyMapper.selectByExample(e);
	}

}
