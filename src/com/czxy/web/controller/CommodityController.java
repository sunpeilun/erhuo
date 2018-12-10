package com.czxy.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.domain.Classify;
import com.czxy.domain.Collect;
import com.czxy.domain.Commodity;
import com.czxy.domain.CommodityImg;
import com.czxy.domain.Message;
import com.czxy.domain.MsgVo;
import com.czxy.domain.User;
import com.czxy.service.ClassifyService;
import com.czxy.service.CollectService;
import com.czxy.service.CommodityImgService;
import com.czxy.service.CommodityService;
import com.czxy.service.MessageService;
import com.czxy.service.UserService;
import com.czxy.utils.MyFileUtils;
import com.czxy.utils.MyJsonUtils;

import cn.itcast.commons.CommonUtils;

@Controller
@RequestMapping("/good")
public class CommodityController {

	@Resource
	private CommodityService commodityService;

	@Resource
	private ClassifyService classifyService;

	@Resource
	private CommodityImgService commodityImgService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private MessageService messageService;
	
	@Resource
	private CollectService collectService;
	
	/**
	 * 输出提示信息
	 * 
	 * @param m
	 * @param suc
	 * @param response
	 */
	private void outMsg(String m, String suc, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");

		String msg = MyJsonUtils.getJsonString(new MsgVo(m, suc));
		try {
			response.getWriter().print(msg);
		} catch (IOException e) {
		}
	}

	/**
	 * 发布二货
	 * 
	 * @return
	 */
	@RequestMapping("/publish.apx")
	public String publish(HttpServletRequest request) {
		List<Classify> selectAll = classifyService.selectAll();
		request.setAttribute("classList", selectAll);
		return "/publish.jsp";
	}

	/**
	 * 添加二货
	 * 
	 * @return
	 */
	/**
	 * @param good
	 * @param imgList
	 * @param session
	 * @param response
	 */
	@RequestMapping("/addGood.apx")
	public void addGood(Commodity good, String[] imgList, HttpServletRequest request, HttpServletResponse response) {

		try {

			// 当前登陆用户
			User loginUser = (User) request.getSession().getAttribute("loginUser");

			good.setCommodityId(CommonUtils.uuid());
			good.setUid(loginUser.getUid());
			good.setReleaseDate(new Date());
			good.setModificationDate(good.getReleaseDate());
			good.setCommodityStatic(0);
			good.setClickNumber(0);
			good.setWhetherBot(0);
			good.setBid(1);

			commodityService.insertCommodity(good);

			List<CommodityImg> commodityImgList = new ArrayList<CommodityImg>();
			for (String imgUrl : imgList) {
				imgUrl = imgUrl.substring(imgUrl.indexOf("\"") + 1, imgUrl.lastIndexOf("\""));
				commodityImgList.add(new CommodityImg(null, imgUrl, good.getCommodityId()));
			}
			commodityImgService.insertImgs(commodityImgList);

			// 把头像拷贝到头像文件夹
			try {
				String tempSrc = "D:\\erhuoImage\\goodTemp";
				String goalSrc = "D:\\erhuoImage\\goods";
				for (CommodityImg commodityImg : commodityImgList) {
					String imgUrl = commodityImg.getImgUrl();
					MyFileUtils.copyFile(new File(tempSrc, imgUrl), new File(goalSrc, imgUrl));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			outMsg("发布成功", "true", response);
		} catch (Exception e) {
			e.printStackTrace();
			outMsg("发布失败", "false", response);

		}
	}

	/**
	 * 查询分类
	 * 
	 * @return
	 */
	@RequestMapping("/findClass.apx")
	public @ResponseBody List<Classify> findClass() {
		try {
			Thread.sleep(500);
		} catch (Exception e) {
		}
		return classifyService.selectAll();
	}
	
	
	/**
	 * 通过分类id查询到所有的商品
	 * @param id
	 * @return
	 */
	@RequestMapping("/showp.apx")
	public String showProduct(@RequestParam(required=true)Integer id,Model model){
		
		List<Commodity> list = commodityService.findByClassId(id);
		
		model.addAttribute("classId",id);
		model.addAttribute("classList",classifyService.selectAll());
		model.addAttribute("list",list);
		
		return "/list.jsp";
	}

	/**
	 *	通过商品id查询商品详情
	 */
	@RequestMapping("/showp2.apx")
	public String findByProduct(String cid,Model model, HttpServletRequest request){
		//通过商品id查询到商品详情
		Commodity commodity = commodityService.findByCid(cid);
	    Integer newClickNumber = commodity.getClickNumber() + 1;
	    commodity.setClickNumber(newClickNumber);
	    commodityService.update(commodity);
		//通过商品里的用户id查询到 卖家
		User user = userService.selectUserById(commodity.getUid());
		
		model.addAttribute("commodity",commodity);
		model.addAttribute("user",user);
		model.addAttribute("img", commodity.getCommodityImgList());
		
		//查询留言
		List<Message> messageList = messageService.selectByCommodity(cid);
		model.addAttribute("messageList",messageList);
		
		/**添加推荐二货*/
		List<Commodity> MaxNumList=commodityService.selectMaxNum();
		model.addAttribute("MaxNumList", MaxNumList);
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser != null){
			Collect collect = collectService.selectByUidAndCommodityId(loginUser.getUid(), cid);
			if(collect != null){
				model.addAttribute("collect","collect");
			}
		}
		return "/details.jsp";
	}
	
	
	
	
	/**
	 * 查询所有的商品
	 * @param id
	 * @return
	 */
	@RequestMapping("/showAll.apx")
	public String showAll(Model model){
		
		List<Commodity> list = commodityService.findAll();
		
		model.addAttribute("classList",classifyService.selectAll());
		model.addAttribute("list",list);
		
		return "/list.jsp";
	}
	
	@RequestMapping("/findGoods.admin")
	public List<Commodity> findGoods(String commodityName){
		return commodityService.selectByName(commodityName);
	}
	
	
}








