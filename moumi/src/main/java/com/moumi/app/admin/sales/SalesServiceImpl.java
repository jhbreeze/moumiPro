package com.moumi.app.admin.sales;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("admin.sales.salesService")
public class SalesServiceImpl implements SalesService{
	@Autowired
	private CommonDAO dao;

	@Override
	public Map<String, Object> todaySales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("sales.todaySales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> thisMonthSales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("sales.thisMonthSales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> previousMonthSales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("sales.previousMonthSales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

}
