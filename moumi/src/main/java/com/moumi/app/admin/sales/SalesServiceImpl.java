package com.moumi.app.admin.sales;

import java.util.List;
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

	@Override
	public List<Map<String, Object>> dayTotalSales(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSales", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalSalesW(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSalesW", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalSalesM(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSalesM", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalSalesT(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSalesT", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalSalesE(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSalesE", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalSalesS(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSalesS", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalSalesF(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.dayTotalSalesF", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSales(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSales", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSalesW(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSalesW", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSalesM(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSalesM", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSalesT(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSalesT", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSalesE(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSalesE", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSalesS(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSalesS", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalSalesF(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("sales.monthTotalSalesF", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
