package com.czxy.service;

import java.util.List;

import com.czxy.domain.Collect;
import com.czxy.domain.Commodity;
import com.czxy.domain.CommodityImg;

public interface CommodityService {

	public void insertCommodity(Commodity commodity);
	
	public List<Commodity> selectByUid(Integer uid);
	
	public List<Commodity> findByClassId(Integer id);
	
	public Commodity findByCid(String cid);
	
	public List<Commodity> selectAll(Integer pageNum);

	public List<Commodity> selectMaxNum();

	public List<Commodity> selectnewestList(Integer pageNum);

	public List<Commodity> selectByName(String commodityName);

	public List<Commodity> selectByNameAndclassify(String commodityName, String id);

	public void update(Commodity commodity);

	public List<Commodity> findAll();

	public Integer findListSize(Integer pageNum);
	
	public Integer findNewListSize(Integer pageNum);
	
	public List<Commodity> selectAllById(List<Collect> collectList);
	
	public void updateStaticByUidAndCommodityId(Integer uid, String commodityId, Integer commodityStatic);
	
	public Commodity selectByPrimaryKey(String CommodityId);

	public void auditing(String[] ids, Integer i);
	
}
