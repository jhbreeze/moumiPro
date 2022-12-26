package com.moumi.app.recruit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;

@Service("recruit.recruitService")
public class RecruitServiceImpl implements RecruitService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertRecruit(Recruit dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("recruit.seq");
			dto.setRecruitNum(seq);

			dao.insertData("recruit.insertRecruit", dto);
			
			if (! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String imageFilename = mf.getOriginalFilename();
					
					dto.setImageFilename(imageFilename);
					dao.insertData("recruit.insertFile", dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Recruit> listRecruit(Map<String, Object> map) {
		List<Recruit> list = null;
		
		try {
			list = dao.selectList("recruit.listRecruit", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("recruit.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Recruit readRecruit(long recruitNum) {
		Recruit dto = null;
		
		try {
			dto = dao.selectOne("recruit.readRecruit", recruitNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Recruit preReadRecruit(Map<String, Object> map) {
		Recruit dto = null;
		
		try {
			dto = dao.selectOne("recruit.preReadRecruit", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Recruit nextReadRecruit(Map<String, Object> map) {
		Recruit dto = null;
		
		try {
			dto = dao.selectOne("recruit.nextReadRecruit", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;

	}

	@Override
	public void updateRecruit(Recruit dto, String pathname) throws Exception {
		try {
			if (! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String imageFilename = mf.getOriginalFilename();
					
					dto.setImageFilename(imageFilename);
					dao.updateData("recruit.updateFile", dto);
				}
			}

			dao.updateData("recruit.updateRecruit", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteRecruit(long recruitNum, String pathname, String userId, long userCode) throws Exception {
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
	public int recruitLikeCount(long recruitNum) {
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

	@Override
	public List<Recruit> listFile(long recruitNum) {
		List<Recruit> listFile = null;
		
		try {
			listFile = dao.selectList("recruit.listFile", recruitNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Recruit readFile(long fileNum) {
		Recruit dto = null;
		
		try {
			dto = dao.selectOne("recruit.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("recruit.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
