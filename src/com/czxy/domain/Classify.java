package com.czxy.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="classification")
public class Classify {
	
	@Id
	private Integer classificationId;			//分类id
	
	private String classificationName;		    //分类名称
	
	private List<Commodity> CommodityList = new ArrayList<Commodity>();	//商品集合

	public Classify() {
		super();
	}

	public Classify(Integer classificationId, String classificationName, List<Commodity> commodityList) {
		super();
		this.classificationId = classificationId;
		this.classificationName = classificationName;
		CommodityList = commodityList;
	}

	public Integer getClassificationId() {
		return classificationId;
	}

	public void setClassificationId(Integer classificationId) {
		this.classificationId = classificationId;
	}

	public String getClassificationName() {
		return classificationName;
	}

	public void setClassificationName(String classificationName) {
		this.classificationName = classificationName;
	}

	public List<Commodity> getCommodityList() {
		return CommodityList;
	}

	public void setCommodityList(List<Commodity> commodityList) {
		CommodityList = commodityList;
	}
	
	
}
