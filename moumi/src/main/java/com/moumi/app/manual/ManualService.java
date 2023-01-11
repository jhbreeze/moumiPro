package com.moumi.app.manual;

import java.util.List;
import java.util.Map;

public interface ManualService {
	public void insertManual(Manual dto, String pathname) throws Exception;
	public void updateManual(Manual dto, String pathname) throws Exception;
	public void deleteManual(long manualNum, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Manual> listManual(Map<String, Object> map);

	public Manual readManual(long manualNum);
	public Manual preReadManual(Map<String, Object> map);
	public Manual nextReadManual(Map<String, Object> map);
	
	public List<Manual> listManualFile(long manualNum);
	public void deleteFile(Map<String, Object>map) throws Exception;

}
