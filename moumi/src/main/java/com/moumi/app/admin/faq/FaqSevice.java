package com.moumi.app.admin.faq;

import java.util.List;
import java.util.Map;

public interface FaqSevice {
	public void insertFaq(Faq dto) throws Exception;
	public void updateFaq(Faq dto) throws Exception;
	public void deleteFaq(long faqNum, String pathname) throws Exception;
	
	public int dataCount1(Map<String, Object> map);
	public int dataCount2(Map<String, Object> map);
	public int dataCount3(Map<String, Object> map);
	
	public List<Faq> listFaq1(Map<String, Object> map);
	public List<Faq> listFaq2(Map<String, Object> map);
	public List<Faq> listFaq3(Map<String, Object> map);
	
	public Faq readFaq(long faqNum);
	
	public void deleteFaq(List<Long> faqNums) throws Exception;

}
