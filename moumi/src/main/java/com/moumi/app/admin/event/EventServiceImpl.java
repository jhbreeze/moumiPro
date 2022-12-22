package com.moumi.app.admin.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;

@Service("admin.event.eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertEvent(Event dto, String pathname) throws Exception {
		try {
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);

			System.out.print("inserEvent");
			dao.insertData("event.insertEvent", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateEvent(Event dto, String pathname) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteEvent(long productNum, String pathname) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) throws Exception {
		// 썸네일 이미지
		List<Event> list = null;
		try {

			list = dao.selectList("event.listEvent");

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public Event readEvent(long productNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Event> listEventFile(long productNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
