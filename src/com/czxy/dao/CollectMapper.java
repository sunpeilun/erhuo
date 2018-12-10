package com.czxy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.czxy.domain.Collect;

import tk.mybatis.mapper.common.Mapper;

public interface CollectMapper extends Mapper<Collect> {
}
