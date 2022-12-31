package com.moumi.app;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("region.regionService")

public class RegionServiceImpl implements RegionService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Region> listRegion(Map<String, Object> map) {
	List<Region> listRegion = null;
		
		try {
			listRegion = dao.selectList("region.listRegion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listRegion;
	}

}
