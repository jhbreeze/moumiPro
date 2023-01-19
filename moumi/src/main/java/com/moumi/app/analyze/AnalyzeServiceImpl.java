package com.moumi.app.analyze;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.Count;

@Service("analyze.analyzeService")
public class AnalyzeServiceImpl implements AnalyzeService {
	@Autowired
	private analyzeMongoOperation analyzeMongo;
	
	
	@Override
	public List<Count> listCount() {
		
		return analyzeMongo.listCount();
	}

}
