package com.moumi.app.admin.main;

import java.util.List;
import java.util.Map;

import com.moumi.app.admin.comment.Comment;

public interface MainTotalService {
	public Map<String, Object> todaySales();
	public Map<String, Object> todaySalesW();
	public Map<String, Object> todaySalesM();
	public Map<String, Object> thisMonthSales();
	public Map<String, Object> previousMonthSales();
	
	public Map<String, Object> dayOfWeekTotalCount(String month);
	public List<Comment> listComment(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);

}
