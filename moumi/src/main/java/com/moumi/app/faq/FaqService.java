package com.moumi.app.faq;

import java.util.List;
import java.util.Map;

import com.moumi.app.admin.faq.Faq;

public interface FaqService {
	
	public List<Faq> listFaq(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	
	public List<Faq> listCategory(Map<String,Object> map);

}
