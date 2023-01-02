package com.moumi.app.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService{

	@Autowired
	private CommonDAO dao;
	@Override
	public void insertPay(Pay dto) throws Exception {
		try {
			dao.insertData("pay.insertPay",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Pay readMember(long userCode) {
		Pay dto = null;
		try {
			dto = dao.selectOne("pay.readMember",userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Pay readPay(int productNum) {
		Pay dto = null;
		try {
			dto = dao.selectOne("pay.readProduct",productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	
}
