package com.czxy.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.czxy.domain.Classify;
import com.czxy.domain.Commodity;
import com.czxy.service.ClassifyService;
import com.czxy.service.CommodityService;

@Controller
@RequestMapping("/Classify")
public class ClassifyController {

	@Resource 
	private ClassifyService classifyService;
	
	@Resource 
	private CommodityService commodityService;
	
	/**
	 * 三个列表都找到
	 * @param request
	 * @param response
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showThreeList.apx")
	public String showTwoList(Integer pageNum,Model model){
		//大分类
		List<Classify> classifyList=classifyService.selectAll();
		model.addAttribute("classifyList", classifyList);
		//商品分类
		if(pageNum==null){pageNum=1;}
		List<Commodity> commodityList=commodityService.selectAll(pageNum);
		model.addAttribute("commodityList", commodityList);
		model.addAttribute("findListSizeMax", (commodityService.findListSize(pageNum)/9+1));
		model.addAttribute("pageNum",pageNum);
		//推荐商品
		List<Commodity> MaxNumList=commodityService.selectMaxNum();
		model.addAttribute("MaxNumList", MaxNumList);
		model.addAttribute("tab",true);
		return "forward:/home.jsp";
	}
	
	/**
	 * 最新
	 * newestList
	 */
	@RequestMapping("/newestList.apx")
	public String newestList(Integer pageNum,Model model){
		//大分类
		List<Classify> classifyList=classifyService.selectAll();
		model.addAttribute("classifyList", classifyList);
		//商品分类
		if(pageNum==null){pageNum=1;}
		List<Commodity> commodityList=commodityService.selectnewestList(pageNum);
		model.addAttribute("commodityList", commodityList);
		model.addAttribute("findListSizeMax", (commodityService.findNewListSize(pageNum)/9+1));
		model.addAttribute("pageNum",pageNum);
		//推荐商品
		List<Commodity> MaxNumList=commodityService.selectMaxNum();
		model.addAttribute("MaxNumList", MaxNumList);
		
		return "forward:/home.jsp";
	}
	
	/**
	 * 搜索
	 * @throws Exception 
	 */
	@RequestMapping("/search.apx")
	public String search(String commodityName,Model model) throws Exception{
		ArrayList<Classify> list = new ArrayList<Classify>();
		list.add(new Classify(null, "没有找到您搜索的商品,为您推荐超人气商品!", null));
		if(commodityName.length()==0){//输入空,就展示推荐商品
			model.addAttribute("classifyList", list);
			model.addAttribute("commodityList", commodityService.selectMaxNum());
			return "forward:/searchList.jsp";
		}
		//大分类
		List<Classify> classifyList=classifyService.selectAll();
		
		//条件查询
		List<Commodity> commodityList=commodityService.selectByName(commodityName);
		if(commodityList.size()==0){//如果没有找到对应商品,就展示推荐商品
			commodityList=commodityService.selectMaxNum();
			classifyList=list;
		}
		
		model.addAttribute("classifyList", classifyList);
		model.addAttribute("commodityList", commodityList);
		//搜索框回显
		model.addAttribute("commodityName", commodityName);
		return "forward:/searchList.jsp";
	}
	
	/**
	 * 搜索中分类
	 * @throws Exception 
	 */
	@RequestMapping("/searchClassify.apx")
	public String searchClassify(@RequestParam(defaultValue="")String id,String commodityName,Model model,HttpServletResponse response) throws Exception{
		commodityName = new String(commodityName.getBytes("iso8859-1"),"UTF-8");
		//System.out.println(id);
		//大分类
		List<Classify> classifyList=classifyService.selectAll();
		model.addAttribute("classifyList", classifyList);
		//条件查询
		List<Commodity> commodityList;
		if(id.isEmpty()){
			commodityList=commodityService.selectByName(commodityName);
		}else{
			commodityList=commodityService.selectByNameAndclassify(commodityName,id);
		}
		model.addAttribute("classId",id);
		model.addAttribute("commodityList", commodityList);
		//搜索框回显
		model.addAttribute("commodityName", commodityName);
		return "forward:/searchList.jsp";
	}
	
	
}
