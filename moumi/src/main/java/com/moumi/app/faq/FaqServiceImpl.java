package com.moumi.app.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.admin.faq.Faq;
import com.moumi.app.common.dao.CommonDAO;

@Service("faq.fqaUService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private CommonDAO dao;
	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaqU",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Faq> listCategory(Map<String, Object> map) {
		List<Faq> listCategory = null;
		
		try {
			listCategory = dao.selectList("faq.listCategory",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

}
