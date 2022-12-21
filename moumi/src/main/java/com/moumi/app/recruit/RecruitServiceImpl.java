package com.moumi.app.recruit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("recruit.recruitService")
public class RecruitServiceImpl implements RecruitService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertRecruit(Recruit dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("recruit.seq");
			dto.setrecruitNum(seq);
			
			dao.insertData("recruit.insertRecruit", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Recruit> listRecruit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Recruit readRecruit(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Recruit preReadRecruit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Recruit nextReadRecruit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateRecruit(Recruit dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRecruit(long num, String pathname, String userId, long userCode) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertRecruitLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRecruitLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int recruitLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean userRecruitLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Recruit> listCareerCategory() {
		List<Recruit> list = null;
		
		try {
			list = dao.selectList("recruit.listCareerCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
