package com.moumi.app;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("home.homeService")

public class HomeServiceImpl implements HomeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private KeywordMongoOperations keywordMongo;

	@Override
	public List<Region> listRegion(Map<String, Object> map) {
		List<Region> listRegion = null;

		try {
			listRegion = dao.selectList("home.listRegion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listRegion;
	}

	@Override
	public List<Report> listMainReport(Map<String, Object> map) {
		List<Report> list = null;

		try {
			list = dao.selectList("home.listMainReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Report readReport(long reportNum) {
		Report dto = null;
		try {
			dto = dao.selectOne("home.readReport", reportNum);
			System.out.println("gg");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Report preReadReport(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Report nextReadReport(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("home.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Report> listReport(Map<String, Object> map) {
		List<Report> list = null;

		try {
			list = dao.selectList("home.listReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SNS> search(String kwd) {
		System.out.println("구현 클래스 search ");
		System.out.println(kwd);
		return keywordMongo.search(kwd);
	}

	@Override
	public int dataCountPay(long userCode) {
		int result = 0;
		try {
			result = dao.selectOne("pay.selectCountPay",userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	

}
