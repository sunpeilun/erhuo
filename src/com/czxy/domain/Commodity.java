package com.czxy.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="commodity")
public class Commodity {
	
	@Id
	private String commodityId;	//商品id
	
	private String commodityName;	//商品名称
	
	private String commodityDetails;	//商品详情
	
	private Double nowPrice;	//现价
	
	private Double costPrice;	//原价
	
	private Integer tradeWay;	//交易方式
	
	private String tradeAddress;	//交易地址
	
	private String phoneNumber; 	//手机号码
	
	private String qqNumber;	//qq号码
	
	private String wxNumber;	//微信号码
	
	private Integer whetherBot; //是否热门
	
	private Integer clickNumber; //点击量
	
	private Integer commodityStatic; //状态
	
	private Date releaseDate;	//发布时间
	
	@Transient
	private Date collectDate; //收藏时间(基于用户id)
	
	public Date getCollectDate() {
		return collectDate;
	}

	public void setCollectDate(Date collectDate) {
		this.collectDate = collectDate;
	}

	private Date modificationDate;	//修改时间
	
	private Integer classificationId;	//商品分类id
	
	private Integer uid; //用户id
	
	private Integer bid;
	
	private User user;	//UserBean
	
	private List<CommodityImg> commodityImgList = new ArrayList<CommodityImg>();	// 商品图片集合

	public Commodity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Commodity(String commodityId, String commodityName, String commodityDetails, Double nowPrice,
			Double costPrice, Integer tradeWay, String tradeAddress, String phoneNumber, String qqNumber,
			String wxNumber, Integer whetherBot, Integer clickNumber, Integer commodityStatic, Date releaseDate,
			Date modificationDate, Integer classificationId, Integer uid, User user,
			List<CommodityImg> commodityImgList) {
		super();
		this.commodityId = commodityId;
		this.commodityName = commodityName;
		this.commodityDetails = commodityDetails;
		this.nowPrice = nowPrice;
		this.costPrice = costPrice;
		this.tradeWay = tradeWay;
		this.tradeAddress = tradeAddress;
		this.phoneNumber = phoneNumber;
		this.qqNumber = qqNumber;
		this.wxNumber = wxNumber;
		this.whetherBot = whetherBot;
		this.clickNumber = clickNumber;
		this.commodityStatic = commodityStatic;
		this.releaseDate = releaseDate;
		this.modificationDate = modificationDate;
		this.classificationId = classificationId;
		this.uid = uid;
		this.user = user;
		this.commodityImgList = commodityImgList;
	}

	public String getCommodityId() {
		return commodityId;
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

	public String getCommodityDetails() {
		return commodityDetails;
	}

	public void setCommodityDetails(String commodityDetails) {
		this.commodityDetails = commodityDetails;
	}

	public Double getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(Double nowPrice) {
		this.nowPrice = nowPrice;
	}

	public Double getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(Double costPrice) {
		this.costPrice = costPrice;
	}

	public Integer getTradeWay() {
		return tradeWay;
	}

	public void setTradeWay(Integer tradeWay) {
		this.tradeWay = tradeWay;
	}

	public String getTradeAddress() {
		return tradeAddress;
	}

	public void setTradeAddress(String tradeAddress) {
		this.tradeAddress = tradeAddress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getQqNumber() {
		return qqNumber;
	}

	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}

	public String getWxNumber() {
		return wxNumber;
	}

	public void setWxNumber(String wxNumber) {
		this.wxNumber = wxNumber;
	}

	public Integer getWhetherBot() {
		return whetherBot;
	}

	public void setWhetherBot(Integer whetherBot) {
		this.whetherBot = whetherBot;
	}

	public Integer getClickNumber() {
		return clickNumber;
	}

	public void setClickNumber(Integer clickNumber) {
		this.clickNumber = clickNumber;
	}

	public Integer getCommodityStatic() {
		return commodityStatic;
	}

	public void setCommodityStatic(Integer commodityStatic) {
		this.commodityStatic = commodityStatic;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public Integer getClassificationId() {
		return classificationId;
	}

	public void setClassificationId(Integer classificationId) {
		this.classificationId = classificationId;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<CommodityImg> getCommodityImgList() {
		return commodityImgList;
	}

	public void setCommodityImgList(List<CommodityImg> commodityImgList) {
		this.commodityImgList = commodityImgList;
	}

	@Override
	public String toString() {
		return "Commodity [commodityId=" + commodityId + ", commodityName=" + commodityName + ", commodityDetails="
				+ commodityDetails + ", nowPrice=" + nowPrice + ", costPrice=" + costPrice + ", tradeWay=" + tradeWay
				+ ", tradeAddress=" + tradeAddress + ", phoneNumber=" + phoneNumber + ", qqNumber=" + qqNumber
				+ ", wxNumber=" + wxNumber + ", whetherBot=" + whetherBot + ", clickNumber=" + clickNumber
				+ ", commodityStatic=" + commodityStatic + ", releaseDate=" + releaseDate + ", modificationDate="
				+ modificationDate + ", classificationId=" + classificationId + ", uid=" + uid + ", user=" + user
				+ ", commodityImgList=" + commodityImgList + "]";
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}


	
}
