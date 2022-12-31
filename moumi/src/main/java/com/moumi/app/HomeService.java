package com.moumi.app;

import java.util.List;
import java.util.Map;

public interface HomeService {
	public List<Region> listRegion(Map<String, Object> map);

	public List<Report> listMainReport(Map<String, Object> map);
}
