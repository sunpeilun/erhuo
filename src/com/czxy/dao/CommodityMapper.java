package com.czxy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.czxy.domain.Commodity;

import tk.mybatis.mapper.common.Mapper;

public interface CommodityMapper extends Mapper<Commodity>{

	@Select("SELECT * FROM commodity WHERE commodity_static = 1 ORDER BY `click_number` DESC")
	public List<Commodity> selectMaxNum();

	@Select("SELECT * FROM commodity WHERE commodity_static = 1 ORDER BY `release_date` DESC")
	public List<Commodity> selectnewestList();
	
	/**
	 * 修改商品状态
	 * @param commodityId
	 */
	@Update("update commodity set commodity_static = #{commodityStatic} where commodity_id = #{commodityId} and uid = #{uid}")
	public void updateStaticByUidAndCommodityId(@Param("uid")Integer uid, @Param("commodityId")String commodityId, @Param("commodityStatic") Integer commodityStatic);
	
}
