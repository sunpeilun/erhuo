package com.czxy.domain;

import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="carrieroperator")
public class Carrieroperator {
	@Id
	private String cid;
	private String cname;
	private String cpassword;
	public Carrieroperator() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	@Override
	public String toString() {
		return "Carrieroperator [cid=" + cid + ", cname=" + cname + ", cpassword=" + cpassword + "]";
	}
	
}
