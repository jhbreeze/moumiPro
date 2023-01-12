package com.moumi.app;

import java.util.ArrayList;
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

	public List<SNS> search(String kwd) {

		// 트위터 크롤링
		BasicQuery twitterQuery = new BasicQuery("{content: { $regex: /" + kwd + "/i}}");

		Pageable pageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		twitterQuery.with(pageable);

		List<Twit> twitList = mongo.find(twitterQuery, Twit.class); // 리스트에 담기

		// 인스타그램 크롤링
		BasicQuery instagramQuery = new BasicQuery("{content: { $regex: /" + kwd + "/i}}");

		Pageable instagramPageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		instagramQuery.with(instagramPageable);

		List<Instagram> instagramList = mongo.find(instagramQuery, Instagram.class); // 리스트에 담기

		System.out.println(instagramList.size() +"인스타 사이즈임둥.. ");
		
		
		List<SNS> list = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			if (twitList.size() > i) {
				SNS obj = new SNS();
				obj.setSns(twitList.get(i).getSns());
				obj.setDate(twitList.get(i).getSns());
				obj.setContent(twitList.get(i).getContent());

				list.add(obj);
			}

			if (instagramList.size() > i) {
				SNS obj = new SNS();
				obj.setSns(instagramList.get(i).getSns());
				obj.setDate(instagramList.get(i).getSns());
				obj.setContent(instagramList.get(i).getContent());
				obj.setTags(instagramList.get(i).getTags());

				list.add(obj);

			}

		}
		return list;
	}
}
