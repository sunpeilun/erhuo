package com.czxy.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="collect")
public class Collect {

	@Id
	private Integer collectId;
	private Date collectDate;
	private String commodityId;
	private Integer uid;
	public Collect() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Collect(Integer collectId, Date collectDate, String commodityId, Integer uid) {
		super();
		this.collectId = collectId;
		this.collectDate = collectDate;
		this.commodityId = commodityId;
		this.uid = uid;
	}
	public Integer getCollectId() {
		return collectId;
	}
	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
	}
	public Date getCollectDate() {
		return collectDate;
	}
	public void setCollectDate(Date collectDate) {
		this.collectDate = collectDate;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Collect [collectId=" + collectId + ", collectDate=" + collectDate + ", commodityId=" + commodityId
				+ ", uid=" + uid + "]";
	}
	
	
	
	
	
}
