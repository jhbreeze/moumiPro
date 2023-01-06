package com.moumi.app.admin.main;

import java.util.Map;

public interface MainTotalService {
	public Map<String, Object> todaySales();
	public Map<String, Object> todaySalesW();
	public Map<String, Object> todaySalesM();
	public Map<String, Object> thisMonthSales();
	public Map<String, Object> previousMonthSales();
	
	public Map<String, Object> dayOfWeekTotalCount(String month);
	

}
