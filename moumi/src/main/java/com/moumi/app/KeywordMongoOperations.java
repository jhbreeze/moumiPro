package com.moumi.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;

import org.springframework.stereotype.Service;

@Service("keyword.KeywordMongoOperations")
public class KeywordMongoOperations {
	@Autowired
	private MongoOperations mongo;

	public Map<String, Object> search(String kwd) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if (kwd.equals("regex")) { // 정규식 형태 

			BasicQuery query = new BasicQuery("{content: { $regex: '^나이키' }}"); // 쿼리
			
			String keyword = null ;
			
			//BasicQuery query = new BasicQuery("{content: { $regex: '^" + keyword  + "' }}"); // 쿼리


			List<Twit> list = mongo.find(query, Twit.class); // 리스트에 담기

				
			resultMap.put("list", list);
		}
		return resultMap;
	}
}
