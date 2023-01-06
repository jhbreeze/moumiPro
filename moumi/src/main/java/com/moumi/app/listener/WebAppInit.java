package com.moumi.app.listener;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;




@WebListener
public class WebAppInit implements ServletContextListener {
	
	private String pathname = "/WEB-INF/users.properties";
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		pathname = sce.getServletContext().getRealPath(pathname);
		
		loadFile();
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {

		saveFile();
	}
	
	protected void saveFile() {
		long toDay, yesterDay, total;
		Properties p = new Properties();
		
		try(FileOutputStream fos = new FileOutputStream(pathname)) {
			toDay = CountManager.getToDayCount();
			yesterDay = CountManager.getYesterDayCount();
			total = CountManager.getTotalCount();
			
			p.setProperty("toDay", Long.toString(toDay));
			p.setProperty("yesterDay", Long.toString(yesterDay));
			p.setProperty("total", Long.toString(total));
			
			p.store(fos, "count");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void loadFile() {
		long toDay, yesterDay, total;
		Properties p = new Properties();
		
		File f = new File(pathname);
		if(! f.exists()) {
			return;
		}
		
		try(FileInputStream fis = new FileInputStream(pathname)) {
			p.load(fis);
			
			toDay = Long.parseLong(p.getProperty("toDay"));
			yesterDay = Long.parseLong(p.getProperty("yesterDay"));
			total = Long.parseLong(p.getProperty("total"));
			
			CountManager.init(toDay, yesterDay, total);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
