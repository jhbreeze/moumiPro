package com.moumi.app;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "keyword") // 재희 - 추가함
public class Keyword {
	@Id
	private ObjectId id; // 재희- 추가함
	private String keyword;
	private String regDate;
	private long userCode;

	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public long getUserCode() {
		return userCode;
	}

	public void setUserCode(long userCode) {
		this.userCode = userCode;
	}

}
