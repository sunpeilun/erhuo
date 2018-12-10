package com.czxy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.czxy.domain.Brand;

import tk.mybatis.mapper.common.Mapper;

public interface BrandMapper extends Mapper<Brand> {

	@Select("SELECT * FROM `brand` b ,`mod_brand` mb WHERE mb.`bid` = b.`bid` AND mb.`mid`=#{mid}")
	@Results(id="brandResults",value={
			@Result(property="bid",column="bid"),
			@Result(property="bname",column="bname"),
			@Result(property="fistName",column="first_num")
	})
	public List<Brand> selectBrandById(@Param("mid") Integer mid);
}
