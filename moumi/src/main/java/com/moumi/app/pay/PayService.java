package com.moumi.app.pay;

public interface PayService {

	public void insertPay(Pay dto) throws Exception;
	public Pay readMember(long userCode);
	public Pay readPay(int productNum);
}
