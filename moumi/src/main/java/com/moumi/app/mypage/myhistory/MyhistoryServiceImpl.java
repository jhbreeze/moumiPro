package com.moumi.app.mypage.myhistory;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("mypage.myhistory.myhistoryService")
public class MyhistoryServiceImpl implements MyhistoryService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Myhistory> listMyhistoryPost(Map<String, Object> map) {
		List<Myhistory> list = null;
		
		try {
			list = dao.selectList("myhistory.myhistoryPost", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("myhistory.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
}
