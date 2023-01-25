package com.moumi.app.pay;

import java.util.List;

import com.moumi.app.admin.event.Coupon;

public interface PayService {

	public void insertPay(Pay dto) throws Exception;
	public Pay readMember(long userCode);
	public Pay readPay(int productNum);
	public int dataCountPay(long userCode);
	public List<Coupon> listCoupon(long userCode);
	public int readcouponPrice(long userCode);
}
