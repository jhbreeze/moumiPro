package com.moumi.app.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface ScheduleService {

	public void insertSchedule(Schedule dto) throws Exception;

	public List<Schedule> listMonth(Map<String, Object> map) throws Exception;

	public Schedule readSchedule(long num) throws Exception;

	public void updateSchedule(Schedule dto) throws Exception;

	public void deleteSchedule(Map<String, Object> map) throws Exception;

	public void insertCategory(Map<String, Object> map) throws Exception;

	public List<Schedule> listCategory(Map<String, Object> map) throws Exception;

	public void deleteCategory(Map<String, Object> map) throws Exception;

}