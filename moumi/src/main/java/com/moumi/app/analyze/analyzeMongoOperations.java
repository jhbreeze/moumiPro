package com.moumi.app.analyze;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

import com.moumi.app.Blog;
import com.moumi.app.Count;
import com.moumi.app.Instagram;
import com.moumi.app.Twit;


@Service("analyze.AnalyzeMongoOperations")
public class analyzeMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	public List<Count> twitList(String kwd, String startDate, String endDate) {
		
		Aggregation aggregation = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("content").regex(kwd).andOperator(Criteria.where("date").gte(startDate), Criteria.where("date").lte(endDate))),
				Aggregation.group("date").count().as("result"),
				Aggregation.sort(Sort.Direction.ASC, "_id")
			);
		
		AggregationResults<Count> twitResults = mongo.aggregate(aggregation, Twit.class, Count.class);
		List<Count> twitCountList = twitResults.getMappedResults();
		
		
		return twitCountList;	
	}
	
	public List<Count> blogList(String kwd, String startDate, String endDate) {
			
			Aggregation aggregation = Aggregation.newAggregation(
					Aggregation.match(Criteria.where("content").regex(kwd).andOperator(Criteria.where("date").gte(startDate), Criteria.where("date").lte(endDate))),
					Aggregation.group("date").count().as("result"),
					Aggregation.sort(Sort.Direction.ASC, "_id")
				);
			
			AggregationResults<Count> blogResults = mongo.aggregate(aggregation, Blog.class, Count.class);
			List<Count> blogCountList = blogResults.getMappedResults();
			
			
			return blogCountList;	
		}
	
	public List<Count> instaList(String kwd, String startDate, String endDate) {
		
		Aggregation aggregation = Aggregation.newAggregation(
				Aggregation.match(Criteria.where("content").regex(kwd).andOperator(Criteria.where("date").gte(startDate), Criteria.where("date").lte(endDate))),
				Aggregation.group("date").count().as("result"),
				Aggregation.sort(Sort.Direction.ASC, "_id")
			);
		
		AggregationResults<Count> instaResults = mongo.aggregate(aggregation, Instagram.class, Count.class);
		List<Count> instaCountList = instaResults.getMappedResults();
		
		
		return instaCountList;	
	}
	
	
	

	
}
