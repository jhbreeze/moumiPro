package com.moumi.app.admin.main;

import java.util.List;
import java.util.Map;

public interface MainTotalService {
	public Map<String, Object> todaySales();
	public Map<String, Object> todaySalesW();
	public Map<String, Object> todaySalesM();
	public Map<String, Object> thisMonthSales();
	public Map<String, Object> previousMonthSales();
	
	public Map<String, Object> dayOfWeekTotalCount(String month);
	public List<Map<String, Object>> dayTotalMoney(String date);
	
	public List<Map<String, Object>> dayTotalSalesW(String date);
	public List<Map<String, Object>> dayTotalSalesM(String date);

}
