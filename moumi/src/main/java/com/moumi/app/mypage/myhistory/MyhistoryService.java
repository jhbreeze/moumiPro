package com.moumi.app.mypage.myhistory;

import java.util.List;
import java.util.Map;

public interface MyhistoryService {
	public List<Myhistory> listMyhistory(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Myhistory readRecruit(String email);
	public void deleteMyhistory(long num, String pathname) throws Exception;
	
	public List<Myhistory> listCareerCategory();
	

}
