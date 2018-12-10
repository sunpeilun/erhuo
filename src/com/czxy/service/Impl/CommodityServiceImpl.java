package com.czxy.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.dao.CommodityImgMapper;
import com.czxy.dao.CommodityMapper;
import com.czxy.domain.Carrieroperator;
import com.czxy.domain.Collect;
import com.czxy.domain.Commodity;
import com.czxy.domain.CommodityImg;
import com.czxy.service.CommodityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class CommodityServiceImpl implements CommodityService {

	@Resource
	private CommodityMapper commodityMapper;

	@Resource
	private CommodityImgMapper commodityImgMapper;

	/**
	 * 添加商品到数据库
	 */
	@Override
	public void insertCommodity(Commodity commodity) {
		commodityMapper.insert(commodity);
	}

	/**
	 * 通过用户id查询关联商品
	 */
	@Override
	public List<Commodity> selectByUid(Integer uid) {
		Example example = new Example(Commodity.class);
		
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("uid", uid);
		example.setOrderByClause("`releasE_Date` DESC");
		return commodityMapper.selectByExample(example);
	}

	/**
	 * 通过分类id查询到所有的商品
	 */
	@Override
	public List<Commodity> findByClassId(Integer id) {

		Example example = new Example(Commodity.class);

		Criteria criteria = example.createCriteria();

		criteria.andEqualTo("classificationId", id);

		List<Commodity> list = commodityMapper.selectByExample(example);

		// 通过商品id 查询到商品所对应的图片
		for (Commodity commodity : list) {

			Example example2 = new Example(CommodityImg.class);
			Criteria criteria2 = example2.createCriteria();
			criteria2.andEqualTo("commodityId", commodity.getCommodityId());
			List<CommodityImg> list2 = commodityImgMapper.selectByExample(example2);
			commodity.setCommodityImgList(list2);

		}

		return list;
	}

	/**
	 * 通过商品id查询到商品详情
	 */
	@Override
	public Commodity findByCid(String cid) {
		Example example = new Example(Commodity.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("commodityId", cid);
		Commodity s = commodityMapper.selectByPrimaryKey(cid);

		// 通过商品id 查询到商品所对应的图片
		Example example2 = new Example(CommodityImg.class);
		Criteria criteria2 = example2.createCriteria();
		criteria2.andEqualTo("commodityId", s.getCommodityId());
		List<CommodityImg> list2 = commodityImgMapper.selectByExample(example2);
		s.setCommodityImgList(list2);

		return s;
	}

	/**
	 * 查所有
	 */
	@Override
	public List<Commodity> selectAll(Integer pageNum) {
		// Random random = new Random();
		// int pageNum = random.nextInt(commodityMapper.selectAll().size()/9);
		PageHelper.startPage(pageNum, 9);
		Example example = new Example(Commodity.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("commodityStatic", 1);
		List<Commodity> list = commodityMapper.selectByExample(example);
		// 添加图片路径
		for (Commodity commodity : list) {
			commodity.setCommodityImgList(getCommodityImgList(commodity));
		}
		PageInfo<Commodity> pageInfo = new PageInfo<>(list);
		return pageInfo.getList();
	}

	public Integer findListSize(Integer pageNum) {
		return selectAll(pageNum).size();
	}

	@Override
	public List<Commodity> selectMaxNum() {
		// 只展示五个,要分页
		PageHelper.startPage(1, 5);
		List<Commodity> list = commodityMapper.selectMaxNum();
		// 添加图片路径
		for (Commodity commodity : list) {
			commodity.setCommodityImgList(getCommodityImgList(commodity));
		}
		PageInfo<Commodity> pageInfo = new PageInfo<>(list);
		return pageInfo.getList();
	}

	@Override
	public List<Commodity> selectnewestList(Integer pageNum) {
		PageHelper.startPage(pageNum, 9);
		List<Commodity> list = commodityMapper.selectnewestList();
		// 添加图片路径
		for (Commodity commodity : list) {
			commodity.setCommodityImgList(getCommodityImgList(commodity));
		}
		PageInfo<Commodity> pageInfo = new PageInfo<>(list);
		return pageInfo.getList();
	}

	public List<CommodityImg> getCommodityImgList(Commodity commodity) {
		Example example = new Example(CommodityImg.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("commodityId", commodity.getCommodityId());
		List<CommodityImg> list2 = commodityImgMapper.selectByExample(example);
		return list2;
	}

	@Override
	public List<Commodity> selectByName(String commodityName) {
		Example example = new Example(Commodity.class);
		Criteria criteria = example.createCriteria();
		criteria.andLike("commodityName", "%" + commodityName + "%");
		criteria.andEqualTo("commodityStatic", 1);
		List<Commodity> list = commodityMapper.selectByExample(example);
		for (Commodity commodity : list) {
			commodity.setCommodityImgList(getCommodityImgList(commodity));
		}
		return list;
	}

	@Override
	public List<Commodity> selectByNameAndclassify(String commodityName, String id) {
		Example example = new Example(Commodity.class);
		Criteria criteria = example.createCriteria();
		criteria.andLike("commodityName", "%" + commodityName + "%");
		criteria.andEqualTo("classificationId", Integer.parseInt(id));
		criteria.andEqualTo("commodityStatic", 1);
		List<Commodity> list = commodityMapper.selectByExample(example);
		for (Commodity commodity : list) {
			commodity.setCommodityImgList(getCommodityImgList(commodity));
		}
		return list;
	}

	/**
	 * 更新商品
	 */
	@Override
	public void update(Commodity commodity) {
		commodityMapper.updateByPrimaryKey(commodity);
	}

	@Override
	public List<Commodity> findAll() {
		List<Commodity> list = commodityMapper.selectAll();
		// 添加图片路径
		for (Commodity commodity : list) {
			commodity.setCommodityImgList(getCommodityImgList(commodity));
		}
		return list;
	}

	@Override
	public List<Commodity> selectAllById(List<Collect> collectList) {
		Example example = new Example(Commodity.class);
		Criteria criteria = example.createCriteria();
		if (collectList == null || collectList.size() == 0) {
			return new ArrayList<Commodity>();
		}
		List<Commodity> list = new ArrayList<Commodity>();
		for (Collect collect : collectList) {
			Commodity commodity = commodityMapper.selectByPrimaryKey(collect.getCommodityId());
			commodity.setCollectDate(collect.getCollectDate());
			list.add(commodity);
		}
		return list;
	}

	@Override
	public Integer findNewListSize(Integer pageNum) {
		return commodityMapper.selectnewestList().size();
	}

	@Override
	public void updateStaticByUidAndCommodityId(Integer uid, String commodityId, Integer commodityStatic) {
//		Example example2 = new Example(CommodityImg.class);
//		Example.Criteria criteria2 = example2.createCriteria();
//		criteria2.andEqualTo("commodityId", commodityId);
//		List<CommodityImg> commodityImgList = commodityImgMapper.selectByExample(example2);
//		commodityImgMapper.deleteByExample(example2);
//		Example example = new Example(Commodity.class);
//		Example.Criteria criteria = example.createCriteria();
//		criteria.andEqualTo("uid", uid);
//		criteria.andEqualTo("commodityId", commodityId);
		commodityMapper.updateStaticByUidAndCommodityId(uid, commodityId, commodityStatic);
	}
	
	@Override
	public Commodity selectByPrimaryKey(String CommodityId){
		Commodity commodity = commodityMapper.selectByPrimaryKey(CommodityId);
		return commodity;
	}

	@Override
	public void auditing(String[] ids, Integer i) {
		Example e = new Example(Commodity.class);
		Criteria cc = e.createCriteria();
		for (String id : ids) {
			if(id.isEmpty()){
				continue;
			}
			cc.orEqualTo("commodityId",id);
		}
		List<Commodity> selectByIds = commodityMapper.selectByExample(e);
		
		for (Commodity commodity : selectByIds) {
			commodity.setCommodityStatic(i);
			commodityMapper.updateByPrimaryKey(commodity);
		}
		
	}

}
