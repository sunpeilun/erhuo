package com.czxy.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.BrandMapper;
import com.czxy.domain.Brand;
import com.czxy.service.BrandService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class BrandServiceImpl implements BrandService {

	@Resource
	private BrandMapper brandMapper;

	@Override
	@Transactional(readOnly = true)
	public List<Brand> findBrand() {
		return brandMapper.selectAll();
	}

	
	@Override
	public void deletes(String[] ids) {
		Example e = new Example(Brand.class);
		Criteria cc = e.createCriteria();
		for (String bid : ids) {
			cc.orEqualTo("bid", bid);
		}
		brandMapper.deleteByExample(e);
	}

	@Override
	public void addBrand(Brand b) {
		brandMapper.insert(b);
	}

	@Override
	public void updateBrand(Brand b) {
		brandMapper.updateByPrimaryKey(b);
	}


	@Override
	public Brand selectBrandById(Integer bid) {
		return brandMapper.selectByPrimaryKey(bid);
	}

}
