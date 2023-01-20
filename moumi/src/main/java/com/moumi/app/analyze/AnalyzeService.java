package com.moumi.app.analyze;

import java.util.List;

import com.moumi.app.Count;


public interface AnalyzeService {
	public List<Result> listCount(String kwd, String startDate, String endDate, List<String> channels);
	
	public List<Count> twitList(String kwd, String startDate, String endDate,String twitter);
	public List<Count> blogList(String kwd, String startDate, String endDate,String blog);
	public List<Count> instaList(String kwd, String startDate, String endDate,String instagram);
}
