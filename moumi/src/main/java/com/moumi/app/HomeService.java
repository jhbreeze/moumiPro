package com.moumi.app;

import java.util.List;
import java.util.Map;

public interface HomeService {
	public List<Region> listRegion(Map<String, Object> map);

	public List<Report> listReport(Map<String, Object> map);

	public List<Report> listMainReport(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);

	public Report readReport(long reportNum);

	public Report preReadReport(Map<String, Object> map);

	public Report nextReadReport(Map<String, Object> map);

	public List<SNS> search(String kwd, String youtube, String instagram, String blog,
			String twitter,String startDate,String endDate);
	
	public List<Youtube> youtubeList(String kwd);
	
	
	public int dataCountPay(long userCode);
	
	public int productCategory(long userCode);
	
	public void insertKeyword(String kwd) throws Exception;
	
	public List<Summary>  keywordList();
	
	public List<String> channel(String kwd, String startDate, String endDate);


}