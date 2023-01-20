package com.moumi.app.analyze;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.Count;
import com.moumi.app.KeywordMongoOperations;

@Service("analyze.analyzeService")
public class AnalyzeServiceImpl implements AnalyzeService {
	@Autowired
	private analyzeMongoOperations analyzeMongo;
	
	@Autowired
	private KeywordMongoOperations keywordMongo;
	
	@Override
	public List<Result> listCount(String kwd, String startDate, String endDate, List<String> channels) {
		List<Result> result = null;
		
		for(String channel: channels) {
			
			if(channel.equals("twitter")) {
				result.add( (Result) analyzeMongo.twitList(kwd, startDate, endDate) );
			} else if(channel == "blog") {
				//result.add( analyzeMongo.blogList(kwd, startDate, endDate) );
			} else {
				//result.add( analyzeMongo.instaList(kwd, startDate, endDate) );
			}
			
		}
		
		return result;
	}

	@Override
	public List<Count> twitList(String kwd, String startDate, String endDate, String twitter) {

		return analyzeMongo.twitList(kwd, startDate, endDate);
	}

	@Override
	public List<Count> blogList(String kwd, String startDate, String endDate, String blog) {

		return analyzeMongo.blogList(kwd, startDate, endDate);
	}

	@Override
	public List<Count> instaList(String kwd, String startDate, String endDate, String instagram) {

		return analyzeMongo.instaList(kwd, startDate, endDate);
	}

}
