package com.moumi.app.admin.event;

import java.util.List;
import java.util.Map;

import com.moumi.app.event.Reply;

public interface EventService {
	public void insertEvent(Event dto, String pathname) throws Exception;

	public void insertCoupon(Coupon dto) throws Exception;

	public void updateEvent(Event dto, String pathname) throws Exception;

	public void deleteEvent(long eventNum, String pathname) throws Exception;

	public int dataCount(Map<String, Object> map);

	public List<Event> listEvent(Map<String, Object> map) throws Exception;

	public Event readEvent(long eventNum);

	public Event preReadEvent(Map<String, Object> map);

	public Event nextReadEvent(Map<String, Object> map);

	public List<Event> listEventFile(long eventNum);

	public List<Reply> listReply(Map<String, Object> map);

	public int replyCount(Map<String, Object> map);

	public int pickCount(long eventNum);

	public int selectEventCount(Map<String, Object> map);

	public void updateWinner(Map<String, Object> map);

	public List<Winner> listWinner(Map<String, Object> map) throws Exception;
	
	public void updatePickStatus(long eventNum) throws Exception ;
	
	
	public int winnerCount(Map<String, Object> map);

	public void updateCoupon(Coupon cdto);

	public Coupon readCoupon(long eventNum);


}
