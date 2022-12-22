package com.moumi.app.admin.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public void insertEvent(Event dto, String pathname) throws Exception;
	public void updateEvent(Event dto, String pathname) throws Exception;
	public void deleteEvent(long productNum, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	
	public Event readEvent(long productNum);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	
	public List<Event> listEventFile(long productNum);
}
