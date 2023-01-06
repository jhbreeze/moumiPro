package com.moumi.app.chatting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;


@Service("chatting.chatMongoOperations")
public class ChatMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	public void insertDialog() throws Exception{
		
	}
	public long dataCount() {
		long result = 0;
		
		try {
			result = mongo.count(new Query(), UserChat.class); // 조건, entityClass
			// result = mongo.count(query, "컬렉션명");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public List<UserChat> listDialog(){
		List<UserChat> list = null;
		
		return list;
	}
	public UserChat readDialog() {
		UserChat dto = null;
		
		return dto; 
	}
}
