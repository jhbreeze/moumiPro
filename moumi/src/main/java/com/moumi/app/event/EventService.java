package com.moumi.app.event;

import java.util.List;
import java.util.Map;


public interface EventService {

	public List<Event> listEvent(Map<String, Object> map) throws Exception;
	
	public Event readEvent(long eventNum);

	public void insertReply(Reply dto) throws Exception;

	public void deleteReply(Map<String, Object> paramMap);

	public int replyCount(Map<String, Object> map);

	public List<Reply> listReply(Map<String, Object> map);
	
	public void deleteReply(long eventNum) throws Exception;



}
