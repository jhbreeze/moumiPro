package com.moumi.app.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	private CommonDAO dao;


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
	public Event readEvent(long eventNum) {
		Event dto = null;
		try {
			// 이벤트 게시글 가져오기
			dto = dao.selectOne("event.readEvent", eventNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
