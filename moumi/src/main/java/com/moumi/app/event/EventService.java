package com.moumi.app.event;

import java.util.List;
import java.util.Map;

public interface EventService {

	public List<Event> listEvent(Map<String, Object> map) throws Exception;
	
	public Event readEvent(long eventNum);


}
