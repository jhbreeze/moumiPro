package com.moumi.app.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.admin.notice.Notice;
import com.moumi.app.common.dao.CommonDAO;


@Service("notice.noticeUService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private CommonDAO dao;

	
	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;

		try {
			list = dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Notice readFile(long filenum) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.listFile",filenum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
