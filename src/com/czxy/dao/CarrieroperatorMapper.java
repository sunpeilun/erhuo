package com.czxy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.czxy.domain.Carrieroperator;

import tk.mybatis.mapper.common.Mapper;
 @Repository
public interface CarrieroperatorMapper extends Mapper<Carrieroperator> {

	@Select("select * from carrieroperator")
	public List<Carrieroperator> findAll();
}
