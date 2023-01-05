package com.moumi.app.admin.sales;

import java.util.List;
import java.util.Map;

public interface SalesService {
	public Map<String, Object> todaySales();
	public Map<String, Object> thisMonthSales();
	public Map<String, Object> previousMonthSales();
	
	public List<Map<String, Object>> dayTotalMoney(String date);

}
