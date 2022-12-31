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

}
