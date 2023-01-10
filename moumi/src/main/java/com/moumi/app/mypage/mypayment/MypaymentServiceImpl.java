package com.moumi.app.mypage.mypayment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("mypage.mypayment.mypaymentService")
public class MypaymentServiceImpl implements MypaymentService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Mypayment> listMypaymentCurrent(Map<String, Object> map) {
		List<Mypayment> post = null;
		
		try {
			post = dao.selectList("mypayment.mypaymentOne", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypayment.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Mypayment> listMypaymentDetail(Map<String, Object> map) {
		List<Mypayment> reply = null;
		
		try {
			reply = dao.selectList("mypayment.mypayment", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reply;
	}

	@Override
	public int dataCountR(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypayment.dataCountR", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	
}
