package com.moumi.app.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("sch.scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private CommonDAO dao;

	@Override
	public void insertSchedule(Schedule dto) throws Exception {
		try {
			if (dto.getAll_day() != null) {
				dto.setStime("");
				dto.setEtime("");
			}

			if (dto.getStime().length() == 0 && dto.getEtime().length() == 0 && dto.getSday().equals(dto.getEday()))
				dto.setEday("");

			if (dto.getRepeat_cycle() != 0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			System.out.println("insert 전");
			dao.insertData("sch.insertSchedule", dto);
			System.out.println("insert 후");
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Schedule> listMonth(Map<String, Object> map) throws Exception {
		List<Schedule> list = null;
		try {
			list = dao.selectList("sch.listMonth", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public Schedule readSchedule(long num) throws Exception {
		Schedule dto = null;
		try {
			dto = dao.selectOne("sch.readSchedule", num);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

	@Override
	public void updateSchedule(Schedule dto) throws Exception {
		try {
			if (dto.getAll_day() != null) {
				dto.setStime("");
				dto.setEtime("");
			}

			if (dto.getStime().length() == 0 && dto.getEtime().length() == 0 && dto.getSday().equals(dto.getEday()))
				dto.setEday("");

			if (dto.getRepeat_cycle() != 0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			dao.updateData("sch.updateSchedule", dto);
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public void deleteSchedule(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("sch.deleteSchedule", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
