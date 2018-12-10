package com.czxy.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.domain.Collect;
import com.czxy.domain.Commodity;
import com.czxy.domain.CommodityImg;
import com.czxy.domain.MsgVo;
import com.czxy.domain.User;
import com.czxy.service.CollectService;
import com.czxy.service.CommodityImgService;
import com.czxy.service.CommodityService;
import com.czxy.service.UserService;
import com.czxy.utils.MyFileUtils;
import com.czxy.utils.MyJsonUtils;
import com.czxy.utils.ValidateCode;
import com.czxy.vo.CommodityVo;

@Controller
@RequestMapping(value = "/user")
public class UserContrller {

	@Resource
	private UserService UserService;
	
	@Resource
	private CommodityService commodityService;
	
	@Resource
	private CommodityImgService commodityImgService;
	
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
	 * 获取验证码
	 * 
	 * @return
	 */
	@RequestMapping(value = "/validateCode.apx")
	public void validateCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		HttpSession session = request.getSession();

		ValidateCode vCode = new ValidateCode(120, 40, 5, 100);
		// 把验证码存到session
		session.setAttribute("code", vCode.getCode());
		vCode.write(response.getOutputStream());
	}

	/**
	 * 用户登陆
	 * 
	 * @param user
	 * @param request
	 * @param response
	 */
	@RequestMapping("/login.apx")
	public void login(User user, HttpServletRequest request, HttpServletResponse response) {

		User loginUser = UserService.login(user);
		if (loginUser == null) {
			outMsg("用户名或密码错误!", "false", response);
			return;
		}
		request.getSession().setAttribute("loginUser", loginUser);
		outMsg("登陆成功!", "true", response);
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/saveUserInfo.apx")
	public void saveUserInfo(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (user == null) {
			outMsg("修改错误!", "false", response);
			return;
		}

		// 判断用户名是否存在
		User findUser = UserService.findUser(user.getUserName());
		if (findUser != null && !findUser.getUid().equals(user.getUid())) {
			outMsg("用户名已存在!", "false", response);
			return;
		}
		User loginUser = UserService.selectUserById(user.getUid());
		user.setPassword(loginUser.getPassword());

		if (!loginUser.getAvatar().equals(user.getAvatar())) {
			String tempSrc = "D:\\erhuoImage\\pictureTemp";
			String goalSrc = "D:\\erhuoImage\\picture";

			// 删除头像文件中的头像
			MyFileUtils.delTemp(goalSrc, user.getUid());

			File temp = new File(tempSrc, user.getAvatar());
			File goal = new File(goalSrc, user.getAvatar());

			// 把头像拷贝到头像文件夹
			try {
				MyFileUtils.copyFile(temp, goal);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 删除缓存文件
			MyFileUtils.delTemp(tempSrc, user.getUid());
		}
		UserService.updateUser(user);
		// 更新session
		request.getSession().setAttribute("loginUser", user);

		outMsg("修改成功!", "true", response);
	}

	// 用户注销功能，注销时删除用户session
	@RequestMapping("/logout.apx")
	public String loginOut(HttpServletRequest request) {
		request.getSession().removeAttribute("loginUser");
		String header = request.getHeader("Referer");
		return "redirect:" + header;
	}

	// 用户注册功能
	@RequestMapping("/register.apx")
	public void register(String captchaCode, User use, HttpServletRequest request, HttpServletResponse response) {

		// 判断验证码是否存在
		String code = (String) request.getSession().getAttribute("code");
		if (code == null) {
			outMsg("验证码已过期!", "false", response);
			return;
		}
		// 判断验证码是否正确
		if (!code.equalsIgnoreCase(captchaCode)) {
			request.getSession().removeAttribute("code");
			outMsg("验证码错误!", "false", response);
			return;
		}

		// 判断用户名是否存在
		User findUser = UserService.findUser(use.getUserName());
		if (findUser != null) {
			outMsg("用户名已存在!", "false", response);
			return;
		}
		// 设置用户默认值
		use.setAvatar("default.png");
		use.setBirthday(new Date());
		use.setPhone("10000");
		use.setSex("男");
		use.setSignature("萌新请多关照");
		// 将用户添加至数据库
		UserService.register(use);
		outMsg("注册成功!", "true", response);
	}

	// 注册验证用户名是否存在
	@RequestMapping("/isUsername.apx")
	public void isUsername(String username, HttpServletRequest request, HttpServletResponse response) throws Exception {
		User attribute = (User) request.getSession().getAttribute("loginUser");
		if (attribute != null && attribute.getUserName().equals(username)) {
			response.getWriter().print("true");
			return;
		}
		User findUser = UserService.findUser(username);
		if (findUser == null) {
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}
	}

	/**
	 * 验证是否有头像
	 */
	@RequestMapping("/isUserPicture.apx")
	public void isUserPicture(String userName, HttpServletResponse response) {
		// 判断用户名是否存在
		User findUser = UserService.findUser(userName);
		String msg = "";
		if (findUser == null) {
			outMsg("", "false", response);
			return;
		} else {
			msg = MyJsonUtils.getJsonString(new MsgVo("", "true", findUser.getAvatar()));
		}

		try {
			response.getWriter().print(msg);
		} catch (IOException e) {
		}
	}
	
	/**
	 * 我发布的
	 * @return
	 * @throws IOException 	
	 * @param request
	 * @param response
	 * @throws IOException
	 * @author 凌枫~
	 */
	@RequestMapping("/myPublish.apx")
	public @ResponseBody List<CommodityVo> myPublish(HttpServletRequest request, HttpServletResponse response) throws IOException{
		User user = (User)request.getSession().getAttribute("loginUser");
		List<Commodity> commodityList = commodityService.selectByUid(user.getUid());
		List<CommodityVo> commodityVoList = new ArrayList<CommodityVo>();
		for (Commodity commodity : commodityList) {
			List<CommodityImg> commoditys = commodityImgService.selectByCommodityId(commodity.getCommodityId());
			CommodityVo commodityVo = new CommodityVo();
			commodityVo.setCommodityId(commodity.getCommodityId());
			commodityVo.setCommodityStatic(commodity.getCommodityStatic());
			commodityVo.setCommodityName(commodity.getCommodityName());	
			commodityVo.setNowPrice(commodity.getNowPrice());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = dateFormat.format(commodity.getReleaseDate());
			commodityVo.setReleaseDate(format);
			if(commoditys.size() != 0){
				commodityVo.setCommodityImgUrl(commoditys.get(0).getImgUrl());
			}
			commodityVoList.add(commodityVo);
		}
		return commodityVoList;
	}
	
	/**
	 * 下架我发布的
	 * @author 凌枫~
	 */
	@RequestMapping("/deleteMyPublish.apx")
	public String deleteMyPublish(HttpServletRequest request, String commodityId){
		User loginUser = (User)request.getSession().getAttribute("loginUser");
//		Commodity commodity = commodityService.selectByPrimaryKey(commodityId);
//		commodity.setCommodityStatic(3);
//		commodityService.update(commodity);
//		for (CommodityImg commodityImg : commodityImgList) {
//			new File("D:\\erhuoImage\\goods\\" + commodityImg.getImgUrl()).delete();
//		}
		commodityService.updateStaticByUidAndCommodityId(loginUser.getUid(), commodityId, 3);
		return "redirect:/user/index.jsp";
	}
	
	/**
	 * 我想要的
	 * @return
	 * @throws IOException 	
	 * @param request
	 * @param response
	 * @throws IOException
	 * @author 凌枫~
	 */
	@RequestMapping("/myWant.apx")
	public @ResponseBody List<CommodityVo> myWant(HttpServletRequest request, HttpServletResponse response) throws IOException{
		User user = (User)request.getSession().getAttribute("loginUser");
		List<Collect> collectList = collectService.selectByUid(user.getUid());
		List<Commodity> commodityList = commodityService.selectAllById(collectList);
		List<CommodityVo> CommodityVoList = new ArrayList<CommodityVo>();
		for (Commodity commodity : commodityList) {
			List<CommodityImg> commoditys = commodityImgService.selectByCommodityId(commodity.getCommodityId());
			CommodityVo CommodityVo = new CommodityVo();
			CommodityVo.setCommodityId(commodity.getCommodityId());
			CommodityVo.setCommodityName(commodity.getCommodityName());
			CommodityVo.setNowPrice(commodity.getNowPrice());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String releaseDate = dateFormat.format(commodity.getReleaseDate());
			CommodityVo.setReleaseDate(releaseDate);
			String collectDate = dateFormat.format(commodity.getCollectDate());
			CommodityVo.setCollectDate(collectDate);
			if(commoditys.size() != 0){
				CommodityVo.setCommodityImgUrl(commoditys.get(0).getImgUrl());
			}
			CommodityVoList.add(CommodityVo);
		}
		return CommodityVoList;
	}
	
	/**
	 * 添加我想要的
	 * @param cid
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addMyWant.apx")
	public void addMyWant(@RequestParam(required=true)String cid, HttpServletRequest request, HttpServletResponse response) throws IOException{
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		Collect collect = new Collect(null, new Date(), cid, loginUser.getUid());
		collectService.insertMyWant(collect);
		MsgVo msgVo = new MsgVo("添加成功", "true", null);
		String jsonStr = MyJsonUtils.getJsonString(msgVo);
		response.getWriter().print(jsonStr);
	}
	
	/**
	 * 删除我想要的
	 * @author 凌枫~
	 */
	@RequestMapping("/deleteMyWant.apx")
	public String deleteMyWant(@RequestParam(required=true)String commodityId, HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("loginUser");
		collectService.deleteByUidAndCommodityId(user.getUid(), commodityId);
		return "redirect:/user/want.jsp";
	}
	
}
