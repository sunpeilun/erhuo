package com.czxy.domain;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="commodity_img")
public class CommodityImg {

	@Id
	private Integer imgId;
	
	private String imgUrl;
	
	private String commodityId;


	public CommodityImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getImgId() {
		return imgId;
	}

	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public CommodityImg(Integer imgId, String imgUrl, String commodityId) {
		super();
		this.imgId = imgId;
		this.imgUrl = imgUrl;
		this.commodityId = commodityId;
	}

	

	

	
	
	
}
