package com.czxy.domain;

import javax.persistence.Table;

@Table(name="suggest")
public class UserSuggest {
private Integer uid;
private String suggestion;
public UserSuggest() {
	super();
	// TODO Auto-generated constructor stub
}
public UserSuggest(Integer uid, String suggestion) {
	super();
	this.uid = uid;
	this.suggestion = suggestion;
}
@Override
public String toString() {
	return "UserSuggest [uid=" + uid + ", suggestion=" + suggestion + "]";
}
public Integer getUid() {
	return uid;
}
public void setUid(Integer uid) {
	this.uid = uid;
}
public String getSuggestion() {
	return suggestion;
}
public void setSuggestion(String suggestion) {
	this.suggestion = suggestion;
}

}