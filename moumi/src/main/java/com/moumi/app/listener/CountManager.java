package com.moumi.app.listener;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class CountManager implements HttpSessionListener {
	private static int currentCount;
	private static long toDayCount, yesterDayCount, totalCount;
	
	public static void init(long toDay, long yesterDay, long total) {
		toDayCount = toDay;
		yesterDayCount = yesterDay;
		totalCount = total;
	}
	
	public CountManager() {
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				yesterDayCount = toDayCount;
				toDayCount = 0;
			}
		};
		
		Timer timer = new Timer();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		
		timer.schedule(task, cal.getTime(), 1000*60*60*24);
		
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();
		
		synchronized (se) {
			currentCount++;
			toDayCount++;
			totalCount++;
			
			context.setAttribute("currentCount", currentCount);
			context.setAttribute("toDayCount", toDayCount);
			context.setAttribute("totalCount", totalCount);
			context.setAttribute("yesterDayCount", yesterDayCount);
		}
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		ServletContext context = session.getServletContext();
		
		synchronized (se) {
			currentCount--;
			if(currentCount < 0) {
				currentCount = 0;
			}
			
			context.setAttribute("currentCount", currentCount);
		}
	}

	public static int getCurrentCount() {
		return currentCount;
	}

	public static long getToDayCount() {
		return toDayCount;
	}

	public static long getYesterDayCount() {
		return yesterDayCount;
	}


	public static long getTotalCount() {
		return totalCount;
	}
	

}
