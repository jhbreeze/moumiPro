package com.moumi.app.mypage.mypayment;

import java.util.List;
import java.util.Map;

import com.moumi.app.mypage.mycoupon.MyCoupon;

public interface MypaymentService {
	public List<Mypayment> listMypaymentCurrent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public List<Mypayment> listMypaymentDetail(Map<String, Object> map);
	public int dataCountR(Map<String, Object> map);
}
