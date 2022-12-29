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

	@Override
	public void insertReply(Reply dto) throws Exception {

		try {
			// 이벤트 리뷰 댓글
			dao.insertData("event.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteReply(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub

	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("event.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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

}
