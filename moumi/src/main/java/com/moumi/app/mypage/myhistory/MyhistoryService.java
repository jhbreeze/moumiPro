package com.moumi.app.mypage.myhistory;

import java.util.List;
import java.util.Map;

public interface MyhistoryService {
	
	public List<Myhistory> listMyhistoryPost(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	
}