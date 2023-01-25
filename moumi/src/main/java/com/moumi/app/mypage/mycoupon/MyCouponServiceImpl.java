package com.moumi.app.mypage.mycoupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("mypage.mycoupon.mycouponService")
public class MyCouponServiceImpl implements MyCouponService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<MyCoupon> listMyCoupon(Map<String, Object> map) {
		List<MyCoupon> couponList = null;

		try {
			couponList = dao.selectList("mycoupon.myCouponList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return couponList;
	}
}
