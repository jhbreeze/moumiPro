package com.moumi.app;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

@Service("keyword.KeywordMongoOperations")
public class KeywordMongoOperations {
	@Autowired
	private MongoOperations mongo;

	public List<SNS> search(String kwd, String youtube, String instagram, String blog, String twitter, String startDate,
			String endDate) {

		// 트위터 크롤링
		BasicQuery twitterQuery = new BasicQuery
				("{$and : [{content: { $regex: /" + kwd + "/i }},  {date: { $gte:'"
				+ startDate + "'" + ",$lte:'" + endDate + "'}}] }");
		Pageable pageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		twitterQuery.with(pageable);

		List<Twit> twitList = mongo.find(twitterQuery, Twit.class);

		// 인스타그램 크롤링
		BasicQuery instagramQuery = new BasicQuery("{$and : [{content: { $regex: /" + kwd + "/i }},  {date: { $gte:'"
				+ startDate + "'" + ",$lte:'" + endDate + "'}}] }");

		Pageable instagramPageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		instagramQuery.with(instagramPageable);

		List<Instagram> instagramList = mongo.find(instagramQuery, Instagram.class);

		// 블로그 크롤링
		BasicQuery BlogQuery = new BasicQuery("{$and : [{content: { $regex: /" + kwd + "/i }}, {date: { $gte:'"
				+ startDate + "'" + ",$lte:'" + endDate + "'}}] }");
		System.out.println(twitterQuery);
		Pageable blogPageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC, "date"));
		BlogQuery.with(blogPageable);

		List<Blog> blogList = mongo.find(BlogQuery, Blog.class);


		if (instagram.equals("0")) {
			instagramList.clear();
		}
		if (blog.equals("0")) {
			blogList.clear();
		}
		if (twitter.equals("0")) {
			twitList.clear();
		}
		
		List<SNS> list = new ArrayList<>();

		for (int i = 0; i < 5; i++) {
			if (twitList.size() > i) {
				SNS obj = new SNS();
				obj.setSns(twitList.get(i).getSns());
				obj.setDate(twitList.get(i).getDate());
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
			if (blogList.size() > i) {
				SNS obj = new SNS();
				obj.setSns(blogList.get(i).getSns());
				obj.setDate(blogList.get(i).getDate());
				obj.setContent(blogList.get(i).getContent());
				obj.setUrl(blogList.get(i).getUrl());
				list.add(obj);

			}

		}
		return list;
	}

	public List<Youtube> youtubeList(String kwd) {

		// 유튜브 크롤링
		BasicQuery youtubeQuery = new BasicQuery("{title: { $regex: /" + kwd + "/i }} ");
		System.out.println(youtubeQuery);
		Pageable pageable = PageRequest.of(0, 6, Sort.by(Sort.Direction.DESC, "date"));
		youtubeQuery.with(pageable);

		List<Youtube> youtubeList = mongo.find(youtubeQuery, Youtube.class);
		return youtubeList;
	}

	// 키워드 저장
	public void insertKeyword(Keyword dto) throws Exception {
		try {
			//mongo.save(dto, "keyword");
			mongo.save(dto);
		} catch (Exception e) {
			e.printStackTrace();

			throw e;
		}
	}

	public List<Summary> keywordList() {
		LocalDate now = LocalDate.now();

		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// 포맷 적용
		String today = now.format(formatter);

		Aggregation keyword = Aggregation.newAggregation(

				Aggregation.match(Criteria.where("regDate").is(today)),
				Aggregation.group("keyword").count().as("count"),

				Aggregation.sort(Sort.Direction.DESC, "count"));

		AggregationResults<Summary> groupResults = mongo.aggregate(keyword, Keyword.class, Summary.class);
		List<Summary> list = groupResults.getMappedResults();

		return list;

	}

	public String channel(String kwd, String startDate, String endDate) {

		String topChannel = null;
		int count = 0;

		// 트위터
		BasicQuery twitterQuery = new BasicQuery("{$and : [{content: { $regex: /" + kwd + "/i }},  {date: { $gte:'"
				+ startDate + "'" + ",$lte:'" + endDate + "'}}] }");
		List<Twit> twitList = mongo.find(twitterQuery, Twit.class);

		// 인스타그램
		BasicQuery instagramQuery = new BasicQuery("{$and : [{content: { $regex: /" + kwd + "/i }},  {date: { $gte:'"
				+ startDate + "'" + ",$lte:'" + endDate + "'}}] }");

		List<Instagram> instagramList = mongo.find(instagramQuery, Instagram.class);
		System.out.println(instagramList.size());


		// 블로그
		BasicQuery BlogQuery = new BasicQuery("{$and : [{content: { $regex: /" + kwd + "/i }}, {date: { $gte:'"
				+ startDate + "'" + ",$lte:'" + endDate + "'}}] }");
		System.out.println(twitterQuery);

		List<Blog> blogList = mongo.find(BlogQuery, Blog.class);

		if (twitList.size() > 0) {
			topChannel = "트위터";
			count = twitList.size();
		}

		if (instagramList.size() > 0) {
			if (count < instagramList.size()) {
				count = instagramList.size();
				topChannel = "인스타그램";
			}

		}

		if (blogList.size() > 0) {
			if (count < blogList.size()) {
				count = blogList.size();
				topChannel = "블로그";
			}

		}

		return topChannel;

	}

	// 트위터 개수
	public List<Map<String, Object>> twitCount(String kwd, String startDate, String endDate) {
		
		Aggregation aggregation = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("content").regex(kwd).andOperator(Criteria.where("date").gte(startDate), Criteria.where("date").lte(endDate))),
				Aggregation.group("date").count().as("result"),
				Aggregation.sort(Sort.Direction.ASC, "_id")
			);
		
		AggregationResults<Count> twitResults = mongo.aggregate(aggregation, Twit.class, Count.class);
		List<Count> twitCountList = twitResults.getMappedResults();
		List<Map<String, Object>> resultList = new ArrayList<>();
		for(Count twitCount : twitCountList) {
			Map<String, Object> tmpMap = new HashMap<>();
			tmpMap.put("id", twitCount.get_id());
			tmpMap.put("result", twitCount.getResult());
			resultList.add(tmpMap);
		}
		return resultList;
	}
	
	// 블로그 개수
	public List<Map<String, Object>> blogCount(String kwd, String startDate, String endDate) {
		
		Aggregation aggregation = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("content").regex(kwd).andOperator(Criteria.where("date").gte(startDate), Criteria.where("date").lte(endDate))),
				Aggregation.group("date").count().as("result"),
				Aggregation.sort(Sort.Direction.ASC, "_id")
			);
		
		AggregationResults<Count> blogResults = mongo.aggregate(aggregation, Blog.class, Count.class);
		List<Count> blogCountList = blogResults.getMappedResults();
		List<Map<String, Object>> resultList = new ArrayList<>();
		for(Count blogCount : blogCountList) {
			Map<String, Object> tmpMap = new HashMap<>();
			tmpMap.put("id", blogCount.get_id());
			tmpMap.put("result", blogCount.getResult());
			resultList.add(tmpMap);
		}
		return resultList;
	}
	

	// 인스타 개수
	public List<Map<String, Object>> instagramCount(String kwd, String startDate, String endDate) {
		
		Aggregation aggregation = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("content").regex(kwd).andOperator(Criteria.where("date").gte(startDate), Criteria.where("date").lte(endDate))),
				Aggregation.group("date").count().as("result"),
				Aggregation.sort(Sort.Direction.ASC, "_id")
			);
		
		AggregationResults<Count> instaResults = mongo.aggregate(aggregation, Instagram.class, Count.class);
		List<Count> instaCountlist = instaResults.getMappedResults();
		List<Map<String, Object>> resultList = new ArrayList<>();
		for(Count instaCount : instaCountlist) {
			Map<String, Object> tmpMap = new HashMap<>();
			tmpMap.put("id", instaCount.get_id());
			tmpMap.put("result", instaCount.getResult());
			resultList.add(tmpMap);
		}
		return resultList;
		
		
	}

	public String day(String kwd, String startDate, String endDate) {

		String date = null;
		int count = 0;

		Aggregation instagram = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("date").gte(startDate).lte(endDate).and("brand").is(kwd)),
				Aggregation.group("date").count().as("count"), Aggregation.sort(Sort.Direction.DESC, "count"),
				Aggregation.limit(1));

		AggregationResults<Summary> todayInstagram = mongo.aggregate(instagram, Instagram.class, Summary.class);

		List<Summary> list1 = todayInstagram.getMappedResults();

		Aggregation twitter = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("date").gte(startDate).lte(endDate).and("brand").is(kwd)),
				Aggregation.group("date").count().as("count"), Aggregation.sort(Sort.Direction.DESC, "count"),
				Aggregation.limit(1));

		AggregationResults<Summary> todayTwitter = mongo.aggregate(twitter, Twit.class, Summary.class);

		List<Summary> list2 = todayTwitter.getMappedResults();

		Aggregation blog = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("date").gte(startDate).lte(endDate).and("brand").is(kwd)),
				Aggregation.group("date").count().as("count"), Aggregation.sort(Sort.Direction.DESC, "count"),
				Aggregation.limit(1));
		AggregationResults<Summary> todayBlog = mongo.aggregate(blog, Blog.class, Summary.class);

		List<Summary> list3 = todayBlog.getMappedResults();

		if (list1.size() > 0) {

			date = list1.get(0).get_id();
			count = list1.get(0).getCount();
		}
		if (list2.size() > 0) {
			if (count < list2.get(0).getCount()) {
				date = list2.get(0).get_id();
				count = list2.get(0).getCount();
			}

		}

		if (list3.size() > 0) {
			if (count < list3.get(0).getCount()) {
				date = list3.get(0).get_id();
				count = list3.get(0).getCount();
			}

		}

		return date;

	}

}