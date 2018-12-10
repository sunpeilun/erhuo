package com.czxy.service;

import java.util.List;

import com.czxy.domain.Collect;

public interface CollectService {

	public List<Collect> selectByUid(Integer uid);
	
	public void deleteByUidAndCommodityId(Integer uid, String commodityId);
	
	public Collect selectByUidAndCommodityId(Integer uid, String commodityId);
	
	public void insertMyWant(Collect collect);
}
