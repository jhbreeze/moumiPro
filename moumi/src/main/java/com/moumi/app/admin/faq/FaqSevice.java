package com.moumi.app.admin.faq;

import java.util.List;
import java.util.Map;

public interface FaqSevice {
	public void insertFaq(Faq dto) throws Exception;
	public void updateFaq(Faq dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Faq> listFaq(Map<String, Object> map);
	public Faq readFaq(long faqNum);
	public void deleteFaq(List<Long> faqNums) throws Exception;
	
	public List<Faq> listCategory(Map<String, Object> map);

}
