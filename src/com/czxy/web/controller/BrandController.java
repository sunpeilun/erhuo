package com.czxy.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.domain.Brand;
import com.czxy.domain.MsgVo;
import com.czxy.service.BrandService;

@Controller
@RequestMapping("/Brand")
public class BrandController {

	@Resource
	private BrandService brandService;
	
	/**
	 * 查询所有品牌
	 * 
	 * @return
	 */
	@RequestMapping("findBrand.admin")
	public @ResponseBody List<Brand> findBrand() {
		List<Brand> blist = brandService.findBrand();
		return blist;
	}
	
	@RequestMapping("delBrand.admin")
	public @ResponseBody MsgVo delBrand(String bid){
		try {
			brandService.deletes(bid.split(","));
			return new MsgVo("删除成功!", "true");
		} catch (Exception e) {
			return new MsgVo("删除失败!", "false");
		}
	}
	
	@RequestMapping("addBrand.admin")
	public @ResponseBody MsgVo addBrand(Brand b){
		try {
			brandService.addBrand(b);
			return new MsgVo("添加成功!", "true");
		} catch (Exception e) {
			return new MsgVo("添加失败!", "false");
		}
	}
	
	@RequestMapping("updateBrand.admin")
	public @ResponseBody MsgVo updateBrand(Brand b){
		try {
			brandService.updateBrand(b);
			return new MsgVo("修改成功!", "true");
		} catch (Exception e) {
			return new MsgVo("修改失败!", "false");
		}
	}
	
	
}
