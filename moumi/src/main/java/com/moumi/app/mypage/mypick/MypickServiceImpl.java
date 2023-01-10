package com.moumi.app.mypage.mypick;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;


@Service("mypage.mypick.mypickService")
public class MypickServiceImpl implements MypickService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Mypick> listMypickScrap(Map<String, Object> map) {
		List<Mypick> scrap = null;
		try {
			scrap  = dao.selectList("mypick.mypickScrap", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return scrap;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypick.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Mypick> listMypickRecruit(Map<String, Object> map) {
		List<Mypick> recruit = null;
		
		try {
			recruit = dao.selectList("mypick.mypickRecruit", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return recruit;
	}

	@Override
	public int dataCountR(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypick.dataCountR", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

}
