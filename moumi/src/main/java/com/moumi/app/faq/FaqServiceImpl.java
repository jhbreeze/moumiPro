package com.moumi.app.faq;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moumi.app.admin.faq.Faq;

@Service("faq.fqaUService")
public class FaqServiceImpl implements FaqService{

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Faq> listCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
