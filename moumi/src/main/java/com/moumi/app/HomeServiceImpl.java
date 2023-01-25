package com.moumi.app;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.bson.types.ObjectId;
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
	public List<SNS> search(String kwd,String youtube,String instagram, String blog, 
			String twitter,String startDate,String endDate) {
		System.out.println(kwd);
		return keywordMongo.search(kwd,youtube,instagram,blog,twitter,startDate,endDate);
	}
	
	@Override
	public List<Youtube> youtubeList(String kwd) {
		System.out.println(kwd);
		return keywordMongo.youtubeList(kwd);
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

	@Override
	public void insertKeyword(String kwd) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(date);
		
		try {
			Keyword dto = new Keyword();
			dto.setId(ObjectId.get());
			dto.setRegDate(now);
			dto.setKeyword(kwd);
			dto.setRegDate(now);
			
			keywordMongo.insertKeyword(dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int productCategory(long userCode) {
		int result = 0;
		try {
			result = dao.selectOne("pay.selectCategory",userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Summary> keywordList() {
		return keywordMongo.keywordList();
	}

	@Override
	public String channel(String kwd, String startDate, String endDate,String instagram, String blog, String twitter) {
		return keywordMongo.channel(kwd, startDate, endDate,instagram,blog,twitter);
	}
	

	@Override
	public List<Map<String, Object>> twitCount(String kwd, String startDate, String endDate) {
		
		return keywordMongo.twitCount(kwd, startDate, endDate);
	}

	@Override
	public List<Map<String, Object>> instaCount(String kwd, String startDate, String endDate) {
		
		return keywordMongo.instagramCount(kwd, startDate, endDate);
	}

	@Override
	public List<Map<String, Object>> blogCount(String kwd, String startDate, String endDate) {
		
		return keywordMongo.blogCount(kwd, startDate, endDate);
	}


	
	@Override
	public String day(String kwd, String startDate, String endDate,String instagram, String blog, String twitter){
		// TODO Auto-generated method stub
		try {
			System.out.println(kwd);
			System.out.println(startDate);
			System.out.println(endDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return keywordMongo.day(kwd, startDate, endDate,instagram,blog,twitter);

	}

	@Override
	public Region readRegion(String code) {
		Region dto = null;
		
		try {
			dto = dao.selectOne("home.readRegion",code);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}



	

}