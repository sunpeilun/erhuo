package com.czxy.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.czxy.domain.Commodity;

public class CommodityVo {

	private String commodityId;
	private Integer commodityStatic;
	private String commodityName;
	private Double nowPrice;
	private String releaseDate;
	private String collectDate;
	private String commodityImgUrl;
	
	private String className;
	private String status;
	private String bname;
	
	public String getCommodityId() {
		return commodityId;
	}
	public Integer getCommodityStatic() {
		return commodityStatic;
	}
	public void setCommodityStatic(Integer commodityStatic) {
		this.commodityStatic = commodityStatic;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	public Double getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(Double nowPrice) {
		this.nowPrice = nowPrice;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getCommodityImgUrl() {
		return commodityImgUrl;
	}
	public void setCommodityImgUrl(String commodityImgUrl) {
		this.commodityImgUrl = commodityImgUrl;
	}
	public String getCollectDate() {
		return collectDate;
	}
	public void setCollectDate(String collectDate) {
		this.collectDate = collectDate;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public CommodityVo() {
		super();
	}
	public CommodityVo(Commodity c) {
		super();
		this.commodityId = c.getCommodityId();
		this.commodityName = c.getCommodityName();
		this.nowPrice = c.getNowPrice();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = dateFormat.format(c.getReleaseDate());
		this.releaseDate = format;
		String[] sta = {"审核中","已审核","审核未通过","已下架"};
		this.status = sta[c.getCommodityStatic()];
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	
}
