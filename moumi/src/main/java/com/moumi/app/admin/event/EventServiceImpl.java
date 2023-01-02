package com.moumi.app.admin.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;
import com.moumi.app.event.Reply;

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
			dao.insertData("adminEvent.insertEvent", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateEvent(Event dto, String pathname) throws Exception {
		try {

			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);

			dao.updateData("adminEvent.updateEvent", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteEvent(long eventNum, String pathname) throws Exception {
		try {
			dao.deleteData("adminEvent.deleteEvent", eventNum);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("adminEvent.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) throws Exception {
		// 썸네일 이미지
		List<Event> list = null;
		try {

			list = dao.selectList("adminEvent.listEvent", map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public Event readEvent(long eventNum) {
		Event dto = null;
		try {
			dto = dao.selectOne("adminEvent.readEvent", eventNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
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

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("event.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("event.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
