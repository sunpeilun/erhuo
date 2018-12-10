package com.czxy.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.czxy.dao.CollectMapper;
import com.czxy.domain.Collect;
import com.czxy.service.CollectService;

import javafx.print.Collation;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class CollectServiceImpl implements CollectService{

	@Resource
	private CollectMapper collectMapper;
	
	@Override
	public List<Collect> selectByUid(Integer uid) {
		Example example = new Example(Collect.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("uid", uid);
		example.setOrderByClause("`collect_date` DESC");
		 List<Collect> list = collectMapper.selectByExample(example);
		return list;
	}

	@Override
	public void deleteByUidAndCommodityId(Integer uid, String commodityId) {
		Example example = new Example(Collect.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("uid", uid);
		criteria.andEqualTo("commodityId", commodityId);
		collectMapper.deleteByExample(example);
	}

	@Override
	public Collect selectByUidAndCommodityId(Integer uid, String commodityId) {
		Example example = new Example(Collect.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("uid", uid);
		criteria.andEqualTo("commodityId", commodityId);
		return collectMapper.selectOneByExample(example);
	}

	@Override
	public void insertMyWant(Collect collect) {
		collectMapper.insert(collect);
	}
	
	
	
}
