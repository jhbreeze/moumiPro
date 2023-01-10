package com.moumi.app.admin.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.admin.comment.Comment;
import com.moumi.app.common.dao.CommonDAO;

@Service("admin.main.mainTotalService")
public class MainTotalServiceImpl implements MainTotalService{
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
			resultMap = dao.selectOne("sales.monthSales");
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
	public Map<String, Object> dayOfWeekTotalCount(String month) {
		Map<String, Object> resultMap = null;
		try {
			resultMap = dao.selectOne("sales.dayOfWeekTotalCount", month);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> todaySalesW() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("sales.todaySalesW");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> todaySalesM() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("sales.todaySalesM");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	@Override
	public List<Comment> listComment(Map<String, Object> map) {
		List<Comment> list = null;
		
		try {
			list = dao.selectList("comment.listComment", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("comment.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
