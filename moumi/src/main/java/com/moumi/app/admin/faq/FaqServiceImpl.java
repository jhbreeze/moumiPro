package com.moumi.app.admin.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("faq.faqService")
public class FaqServiceImpl implements FaqSevice {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertFaq(Faq dto) throws Exception {
		try {
			dao.insertData("faq.insertFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateFaq(Faq dto) throws Exception {
		try {
			dao.updateData("faq.updateFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteFaq(long faqNum, String pathname) throws Exception {
		try {
			dao.deleteData("faq.deleteFaq", faqNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount1(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("faq.dataCount1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Faq> listFaq1(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaq1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Faq> listFaq2(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaq2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Faq readFaq(long faqNum) {
		Faq dto = null;
		
		try {
			dto = dao.selectOne("faq.readFaq", faqNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFaq(List<Long> faqNums) throws Exception {
		try {
			dao.deleteData("faq.deleteList", faqNums);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("faq.dataCount2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount3(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("faq.dataCount3", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Faq> listFaq3(Map<String, Object> map){
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaq3", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

}
