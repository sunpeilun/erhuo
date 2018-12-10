package com.czxy.domain;

import java.util.Date;

import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	
	/*
	 * CREATE TABLE `user` (
		  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
		  `user_name` varchar(16) DEFAULT NULL COMMENT '用户名',
		  `password` varchar(16) DEFAULT NULL COMMENT '密码',
		  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
		  `signature` varchar(40) DEFAULT NULL COMMENT '个性签名',
		  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
		  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
		  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
		  `birthday` datetime DEFAULT NULL COMMENT '生日',
		  `residence` varchar(40) DEFAULT NULL COMMENT '省-市-县',
		  PRIMARY KEY (`uid`)
		) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8

	 * */
	
	@Id
	private Integer uid;
	private String userName;
	private String password;
	private String avatar;
	private String signature;
	private String phone;
	private String email;
	private String sex;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	
	private String residence;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", userName=" + userName + ", password=" + password + ", avatar=" + avatar
				+ ", signature=" + signature + ", phone=" + phone + ", email=" + email + ", sex=" + sex + ", birthday="
				+ birthday + ", residence=" + residence + "]";
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}

	public User() {
		super();
	}
	
	

}
