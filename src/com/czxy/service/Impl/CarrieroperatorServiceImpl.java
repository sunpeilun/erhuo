package com.czxy.service.Impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.czxy.dao.CarrieroperatorMapper;
import com.czxy.domain.Carrieroperator;
import com.czxy.service.CarrieroperatorService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
@Service
public class CarrieroperatorServiceImpl implements CarrieroperatorService {
	@Resource
	private CarrieroperatorMapper carr;
	@Override
	public Carrieroperator login(Carrieroperator ca) {
		 Carrieroperator one = carr.selectOne(ca);
		return one;
	}
	
	 
   
}
