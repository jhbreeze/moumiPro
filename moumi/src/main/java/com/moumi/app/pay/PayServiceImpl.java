package com.moumi.app.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.admin.event.Coupon;
import com.moumi.app.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService{

	@Autowired
	private CommonDAO dao;
	@Override
	public void insertPay(Pay dto) throws Exception {
		try {
			dao.insertData("pay.insertPay",dto);
			dao.insertData("pay.insertProduct",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Pay readMember(long userCode) {
		Pay dto = null;
		try {
			dto = dao.selectOne("pay.selectMember",userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Pay readPay(int productNum) {
		Pay dto = null;
		try {
			dto = dao.selectOne("pay.selectProduct",productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
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
	public List<Coupon> listCoupon(long userCode) {
			List<Coupon> list = null;
			try {
				list = dao.selectList("pay.listCoupon",userCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}

	@Override
	public int readcouponPrice(long userCode) {
		int price = 0;
		try {
			price = dao.selectOne("pay.readCoupon",userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return price;
	}

	

	
}
