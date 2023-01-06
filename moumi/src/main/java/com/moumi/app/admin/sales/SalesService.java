package com.moumi.app.admin.sales;

import java.util.List;
import java.util.Map;

public interface SalesService {
	public Map<String, Object> todaySales();
	public Map<String, Object> thisMonthSales();
	public Map<String, Object> previousMonthSales();
	
	public List<Map<String, Object>> dayTotalSales(String date);
	
	public List<Map<String, Object>> dayTotalSalesW(String date);
	public List<Map<String, Object>> dayTotalSalesM(String date);
	
	public List<Map<String, Object>> dayTotalSalesT(String date);
	public List<Map<String, Object>> dayTotalSalesE(String date);
	public List<Map<String, Object>> dayTotalSalesS(String date);
	public List<Map<String, Object>> dayTotalSalesF(String date);
	
	public List<Map<String, Object>> monthTotalSales(String month);
	
	public List<Map<String, Object>> monthTotalSalesW(String month);
	public List<Map<String, Object>> monthTotalSalesM(String month);
	
	public List<Map<String, Object>> monthTotalSalesT(String month);
	public List<Map<String, Object>> monthTotalSalesE(String month);
	public List<Map<String, Object>> monthTotalSalesS(String month);
	public List<Map<String, Object>> monthTotalSalesF(String month);
	
	public List<Map<String, Object>> monthTotalPie(String month);
	
	public List<Map<String, Object>> monthTotalPieW(String month);
	public List<Map<String, Object>> monthTotalPieM(String month);
	
	public List<Map<String, Object>> monthTotalPieT(String month);
	public List<Map<String, Object>> monthTotalPieE(String month);
	public List<Map<String, Object>> monthTotalPieS(String month);
	public List<Map<String, Object>> monthTotalPieF(String month);

}
