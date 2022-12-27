package com.moumi.app.admin.report;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;

@Service("admin.report.reportService")
public class ReportServiceImpl implements ReportService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertReport(Report dto, String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
			
			long reportNum = dao.selectOne("report.reportSeq");
			dto.setReportNum(reportNum);
			dao.insertData("report.insertReport", dto);
			
			if(!dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setImageFilename(filename);
					
					dao.insertData("report.insertReportFile", dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateReport(Report dto, String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
			
			long reportNum = dao.selectOne("report.reportSeq");
			dto.setReportNum(reportNum);
			dao.insertData("report.updateReport", dto);
			
			if(!dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setImageFilename(filename);
					
					dao.insertData("report.updateReportFile", dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteReport(long reportNum, String pathname) throws Exception {
		try {
			List<Report> listFile = listReportFile(reportNum);
			if(listFile != null) {
				for (Report dto : listFile) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
			}
			
			dao.deleteData("report.deleteReport", reportNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("report.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Report> listReport(Map<String, Object> map) {
		List<Report> list = null;
		
		try {
			list = dao.selectList("report.listReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Report readReport(long reportNum) {
		Report dto = null;
		try {
			dto = dao.selectOne("report.readReport", reportNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Report preReadReport(Map<String, Object> map) {
		Report dto = null;
		try {
			dto = dao.selectOne("report.preReadReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Report nextReadReport(Map<String, Object> map) {
		Report dto = null;
		try {
			dto = dao.selectOne("report.nextReadReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Report> listReportFile(long reportNum) {
		List<Report> listFile = null;
		
		try {
			listFile = dao.selectList("report.reportFile", reportNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listFile;
	}

}
