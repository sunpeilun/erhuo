package com.czxy.domain;

import java.io.Serializable;

public class MsgVo implements Serializable {

	private String msg;
	private String success;
	private String src;

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public MsgVo(String msg, String success) {
		super();
		this.msg = msg;
		this.success = success;
	}

	public MsgVo() {
		super();
	}

	public MsgVo(String msg, String success, String src) {
		super();
		this.msg = msg;
		this.success = success;
		this.src = src;
	}

}
