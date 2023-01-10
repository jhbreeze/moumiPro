package com.moumi.app.mypage.mypick;

import java.util.List;
import java.util.Map;


public interface MypickService {
	public List<Mypick> listMypickScrap(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public List<Mypick> listMypickRecruit(Map<String, Object> map);
	public int dataCountR(Map<String, Object> map);
}
