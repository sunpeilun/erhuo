package com.czxy.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.domain.Carrieroperator;
import com.czxy.domain.Classify;
import com.czxy.domain.Commodity;
import com.czxy.domain.MsgVo;
import com.czxy.service.BrandService;
import com.czxy.service.CarrieroperatorService;
import com.czxy.service.ClassifyService;
import com.czxy.service.CommodityService;
import com.czxy.vo.CommodityVo;

@Controller
public class CarrieroperatorController {
	@Resource
	private CarrieroperatorService carr;

	@RequestMapping("/login.admin")
	public String login(Model model, Carrieroperator ca, HttpServletRequest req) {

		Carrieroperator login = carr.login(ca);
		System.out.println(login);
		if (login != null) {
			req.getSession().setAttribute("login", login);
			return "redirect:/admin/index.jsp";
		}
		model.addAttribute("Msg", "用户名或密码错误");
		return "forward:/admin_login.jsp";
	}

	@Resource
	private CommodityService commservice;

	@Resource
	private ClassifyService classifyService;

	@Resource
	private BrandService brandService;

	@RequestMapping("/findGoods.admin")
	public @ResponseBody List<CommodityVo> findGoods(String commodityName) {
		List<CommodityVo> cVos = new ArrayList<CommodityVo>();
		List<Commodity> findAll = commservice.selectByName(commodityName);
		List<Classify> selectAll = classifyService.selectAll();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (Classify classify : selectAll) {
			int num = classify.getClassificationId();
			map.put(num, classify.getClassificationName());
		}
		for (Commodity commodity : findAll) {
			CommodityVo c = new CommodityVo(commodity);
			c.setClassName(map.get(commodity.getClassificationId()));
			c.setBname(brandService.selectBrandById(commodity.getBid()).getBname());
			cVos.add(c);
		}

		return cVos;
	}

	// 原生ajax

	@RequestMapping("auditing.admin")
	public @ResponseBody MsgVo auditing(String ids, @RequestParam(required = true) Integer status) {
		try {
			commservice.auditing(ids.split(","), status);
			return new MsgVo("修改成功！", "true");
		} catch (Exception e) {
			return new MsgVo("修改失敗！", "false");
		}

	}

}
