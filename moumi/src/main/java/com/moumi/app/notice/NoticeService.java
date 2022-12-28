package com.moumi.app.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	public List<Notice> listNotice(Map<String,Object> map);
	public int dataCount(Map<String, Object> map);
}
