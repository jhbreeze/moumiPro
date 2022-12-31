package com.moumi.app.admin.sales;

import java.util.Map;

public interface SalesService {
	public Map<String, Object> todaySales();
	public Map<String, Object> thisMonthSales();
	public Map<String, Object> previousMonthSales();

}
