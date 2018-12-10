package com.czxy.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.CommodityImgMapper;
import com.czxy.domain.Commodity;
import com.czxy.domain.CommodityImg;
import com.czxy.service.CommodityImgService;

import tk.mybatis.mapper.entity.Example;

@Service
@Transactional
public class CommodityImgServiceImpl implements CommodityImgService{

	@Resource
	private CommodityImgMapper commodityImgMapper;
	
	@Override
	public void insertImgs(List<CommodityImg> commodityImgList) {
		for (CommodityImg commodityImg : commodityImgList) {
			commodityImgMapper.insert(commodityImg);
		}
	}

	@Override
	public List<CommodityImg> selectByCommodityId(String CommodityId) {
		Example example = new Example(CommodityImg.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("commodityId", CommodityId);
		return commodityImgMapper.selectByExample(example);
	}
 
}
