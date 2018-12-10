package com.czxy.service;

import java.util.List;

import com.czxy.domain.CommodityImg;

public interface CommodityImgService {

	void insertImgs(List<CommodityImg> commodityImgList);
	
	public List<CommodityImg> selectByCommodityId(String CommodityId);

}
