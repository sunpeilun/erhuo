package com.czxy.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.czxy.domain.MsgVo;
import com.czxy.utils.MyJsonUtils;

import cn.itcast.commons.CommonUtils;

@Controller
public class ImageController {

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
	 * 保存头像到临时文件夹
	 * 
	 * @param picFile
	 * @param uid
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("user.image")
	public void upload(MultipartFile picFile, Integer uid, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String realPath = request.getSession().getServletContext().getRealPath("images");
		if (uid == null) {
			throw new RuntimeException();
		}

		String name = picFile.getOriginalFilename();
		// 保存文件到指定的位置
		String fileName = name.substring(name.lastIndexOf("."));
		File file = new File(realPath + "/pictureTemp", uid + fileName);
		operation(file, picFile, response);
	}

	/**
	 * 保存商品图片到临时文件夹
	 * 
	 * @param picFile
	 * @param response
	 */
	@RequestMapping("goods.image")
	public void uploadGoods(MultipartFile picFile, HttpServletRequest request, HttpServletResponse response) {
		String name = picFile.getOriginalFilename();
		String realPath = request.getSession().getServletContext().getRealPath("images");
		// 保存文件到指定的位置
		String fileName = name.substring(name.lastIndexOf("."));

		File file = new File(realPath + "/goodTemp", CommonUtils.uuid() + fileName);
		operation(file, picFile, response);
	}

	private void operation(File file, MultipartFile picFile, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		String msg = "";
		try {
			if (file.exists()) {
				file.delete();
				file.createNewFile();
			}
			picFile.transferTo(file);

			msg = MyJsonUtils.getJsonString(new MsgVo("上传成功!", "true", file.getName()));
		} catch (Exception e) {
			msg = MyJsonUtils.getJsonString(new MsgVo("上传失败!", "false"));
			throw new RuntimeException(e);
		}
		try {
			response.getWriter().print(msg);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 显示图片
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/image.apx")
	public void validateCode(String path, String temp, HttpServletRequest request, HttpServletResponse response) {
		try {
			String realPath = request.getSession().getServletContext().getRealPath("images");
			
			System.out.println(realPath);
			// 设置响应的类型格式为图片格式
			response.setContentType("image/jpeg");
			// 禁止图像缓存。
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);

			String url = "/picture";
			if (temp != null) {
				url = "/pictureTemp";
			}
			File file = new File(realPath + url, path);

			ServletOutputStream outputStream = response.getOutputStream();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
			IOUtils.copy(bufferedInputStream, outputStream);
			bufferedInputStream.close();
			outputStream.close();
		} catch (Exception e) {
		}
	}

	/**
	 * 显示商品图片
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/goodImage.apx")
	public void GoodCode(String path, String temp, HttpServletRequest request, HttpServletResponse response) {
		try {
			String realPath = request.getSession().getServletContext().getRealPath("images");
			// 设置响应的类型格式为图片格式
			response.setContentType("image/jpeg");
			// 禁止图像缓存。
			// response.setHeader("Pragma", "no-cache");
			// response.setHeader("Cache-Control", "no-cache");
			// response.setDateHeader("Expires", 0);
			String url = "/goods";
			if (temp != null) {
				url = "/goodTemp";
			}
			File file = new File(realPath + url, path);

			ServletOutputStream outputStream;
			outputStream = response.getOutputStream();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
			IOUtils.copy(bufferedInputStream, outputStream);
			bufferedInputStream.close();
			outputStream.close();
		} catch (Exception e) {
		}
	}

	/**
	 * 删除图片
	 * 
	 * @param type
	 * @param temp
	 * @param path
	 */
	@RequestMapping("deleteImage.apx")
	public void deleteImage(String type, String temp, String path, HttpServletRequest request, HttpServletResponse response) {
		try {

			String realPath = request.getSession().getServletContext().getRealPath("images");
			if (temp != null && !temp.isEmpty()) {
				temp = "Temp";
			} else {
				temp = "";
			}
			if (type.equals("good")) {
				path = "\\good" + temp + "\\" + path;
			} else if (type.equals("user")) {
				path = "\\picture" + temp + "\\" + path;
			}
			new File(realPath + path).delete();
			outMsg("删除成功!", "true", response);
		} catch (Exception e) {
			outMsg("删除失败!", "false", response);
			throw new RuntimeException(e);
		}

	}

}
