package com.moumi.app.analyze;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Service;

import com.moumi.app.Count;

@Service("analyze.AnalyzeMongoOperations")
public class analyzeMongoOperation {
	@Autowired
	private MongoOperations mongo;
	
	public List<Count> listCount() {
		List<Count> list = null;
		
		return list;

	}

	
}
