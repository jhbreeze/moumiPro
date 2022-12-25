package com.moumi.app.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("sch.scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	@Override
	public void insertSchedule(Schedule dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Schedule> listMonth(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Schedule readSchedule(long num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSchedule(Schedule dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteSchedule(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertCategory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Schedule> listCategory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

}
