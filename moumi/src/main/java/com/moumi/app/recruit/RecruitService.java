package com.moumi.app.recruit;

import java.util.List;
import java.util.Map;

public interface RecruitService {
	public void insertRecruit(Recruit dto, String pathname) throws Exception;
	public List<Recruit> listRecruit(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Recruit readRecruit(long recruitNum);
	public Recruit preReadRecruit(Map<String, Object> map);
	public Recruit nextReadRecruit(Map<String, Object> map);
	public void updateRecruit(Recruit dto, String pathname) throws Exception;
	public void deleteRecruit(long recruitNum, String pathname, String userId, long userCode) throws Exception;
	
	public void insertRecruitLike(Map<String, Object> map) throws Exception;
	public void deleteRecruitLike(Map<String, Object> map) throws Exception;
	public int recruitLikeCount(long recruitNum);
	public boolean userRecruitLiked(Map<String, Object> map); // ??
	
	public List<Recruit> listCareerCategory();
	
	public List<Recruit> listFile(long recruitNum);
	public Recruit readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

}
