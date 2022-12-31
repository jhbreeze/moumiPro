package com.moumi.app.admin.report;

import java.util.List;
import java.util.Map;

public interface ReportService {
	public void insertReport(Report dto, String pathname) throws Exception;
	public void updateReport(Report dto, String pathname) throws Exception;
	public void deleteReport(long reportNum, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Report> listReport(Map<String, Object> map);

	public Report readReport(long reportNum);
	public Report preReadReport(Map<String, Object> map);
	public Report nextReadReport(Map<String, Object> map);
	
	public List<Report> listReportFile(long reportNum);
	public void deleteFile(Map<String, Object>map) throws Exception;

}
