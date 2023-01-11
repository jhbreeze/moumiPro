package com.moumi.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Service;




@Service("keyword.KeywordMongoOperations")
public class KeywordMongoOperations {
	@Autowired
	private MongoOperations mongo;

	public List<Twit> search(String kwd) {
		
		BasicQuery query = new BasicQuery("{content: { $regex: /" + kwd + "/i}}");
		
		Pageable pageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		query.with(pageable);
		
		List<Twit> list = mongo.find(query, Twit.class); // 리스트에 담기

		
		
		return list;
	}
}
