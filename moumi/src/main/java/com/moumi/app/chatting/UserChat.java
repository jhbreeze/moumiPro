package com.moumi.app.chatting;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Document(collection ="chatting" )
public class UserChat {
	@Id
	private long userCode;
	private String email;
	private String nickName;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date created;
	
	public long getUserCode() {
		return userCode;
	}
	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	
	
}
