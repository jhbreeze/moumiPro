package com.moumi.app;

import java.text.SimpleDateFormat;
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

	public List<SNS> search(String kwd,String youtube,String instagram,String blog,String twitter) {

		// 트위터 크롤링
		BasicQuery twitterQuery = new BasicQuery("{content: { $regex: /" + kwd + "/i}}");
		System.out.println(twitterQuery);
		Pageable pageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		twitterQuery.with(pageable);

		List<Twit> twitList = mongo.find(twitterQuery, Twit.class);
		System.out.println(twitList.size());
		// 인스타그램 크롤링
		BasicQuery instagramQuery = new BasicQuery("{content: { $regex: /"+kwd+"/i }}");

		Pageable instagramPageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		instagramQuery.with(instagramPageable);

		List<Instagram> instagramList = mongo.find(instagramQuery, Instagram.class);
		System.out.println(instagramList.size());
		// 블로그 크롤링

		// 뉴스 크롤링

		List<SNS> list = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(instagram.equals("0")) {
			instagramList.clear();
		}
//		if(blog.equals("0")) {
//			blogList.clear();
//		}
		if(twitter.equals("0")) {
			twitList.clear();
		}
		
		
		for (int i = 0; i < 5; i++) {
			if (twitList.size() > i) {
				SNS obj = new SNS();
				obj.setSns(twitList.get(i).getSns());
				obj.setDate(sdf.format(twitList.get(i).getDate()));
				obj.setUrl(twitList.get(i).getUrl());
				obj.setContent(twitList.get(i).getContent());

				list.add(obj);
			}

			if (instagramList.size() > i) {
				SNS obj = new SNS();
				obj.setSns(instagramList.get(i).getSns());
				obj.setDate(instagramList.get(i).getDate());
				obj.setContent(instagramList.get(i).getContent());
				obj.setUrl(instagramList.get(i).getUrl());
				obj.setTags(instagramList.get(i).getTags());

				list.add(obj);

			}

		}
		return list;
	}
	
	// 키워드 저장
	public void insertKeyword(Keyword dto) throws Exception {
		try {
			mongo.save(dto, "keyword");
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
	}
}