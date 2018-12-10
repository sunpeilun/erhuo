package com.czxy.domain;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品品牌表
 * @author admin
 *
 */
@Table(name="brand")
public class Brand {

	@Id
	private Integer bid;
	
	private String bname;
	
	@Column(name="first_num")
	private String fistName;

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getFistName() {
		return fistName;
	}

	public void setFistName(String fistName) {
		this.fistName = fistName;
	}
	
}
