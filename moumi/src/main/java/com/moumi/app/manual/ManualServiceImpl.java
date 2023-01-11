package com.moumi.app.manual;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;

@Service("manual.manualService")
public class ManualServiceImpl implements ManualService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertManual(Manual dto, String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
			
			long manualNum = dao.selectOne("manual.seq");
			dto.setManualNum(manualNum);
			dao.insertData("manual.insertManual", dto);
			
			if(!dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setImageFilename(filename);
					
					dao.insertData("manual.insertManualFile", dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateManual(Manual dto, String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
			
			dao.insertData("manual.updateManual", dto);
			
			if(!dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setImageFilename(filename);
					
					dao.insertData("manual.updateManualFile", dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteManual(long manualNum, String pathname) throws Exception {
		try {
			List<Manual> listFile = listManualFile(manualNum);
			if(listFile != null) {
				for (Manual dto : listFile) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
			}
			
			dao.deleteData("manual.deleteManual", manualNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("manual.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Manual> listManual(Map<String, Object> map) {
		List<Manual> list = null;
		
		try {
			list = dao.selectList("manual.listManual", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Manual readManual(long manualNum) {
		Manual dto = null;
		try {
			dto = dao.selectOne("manual.readManual", manualNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Manual preReadManual(Map<String, Object> map) {
		Manual dto = null;
		try {
			dto = dao.selectOne("manual.preReadManual", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Manual nextReadManual(Map<String, Object> map) {
		Manual dto = null;
		try {
			dto = dao.selectOne("manual.nextReadManual", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Manual> listManualFile(long manualNum) {
		List<Manual> listFile = null;
		
		try {
			listFile = dao.selectList("manual.listManualFile", manualNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listFile;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("manual.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
