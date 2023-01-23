package com.moumi.app;

import java.util.List;
import java.util.Map;

public interface HomeService {
	public List<Region> listRegion(Map<String, Object> map);

	public List<Report> listReport(Map<String, Object> map);

	public List<Report> listMainReport(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);

	public Report readReport(long reportNum);

	public List<SNS> search(String kwd, String youtube, String instagram, String blog,
			String twitter,String startDate,String endDate);
	
	public List<Youtube> youtubeList(String kwd);
	
	
	public int dataCountPay(long userCode);
	
	public int productCategory(long userCode);
	
	public void insertKeyword(String kwd) throws Exception;
	
	public List<Summary>  keywordList();
		
	public String channel(String kwd, String startDate, String endDate,String instagram, String blog, String twitter);

	public List<Map<String, Object>> twitCount(String kwd, String startDate, String endDate);
	
	public List<Map<String, Object>> instaCount(String kwd, String startDate, String endDate);
	
	public List<Map<String, Object>> blogCount(String kwd, String startDate, String endDate);
	
	public String day(String kwd, String startDate, String endDate,String instagram, String blog, String twitter);


}