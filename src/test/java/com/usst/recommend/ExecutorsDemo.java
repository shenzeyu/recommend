package com.usst.recommend;

import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.lang.time.DateFormatUtils;

public class ExecutorsDemo {
	public void test() throws Throwable{
		Runnable task = new DemonstrationRunnable();
		ExecutorService cachedThreadPoolExecutorService = Executors.newCachedThreadPool();
		if(cachedThreadPoolExecutorService.submit(task).get() == null){
			System.out.printf("the cachedThreadPoolExecutorService has succeeded at %s \n",new Date());
		}
		ExecutorService fixedThreadPool = Executors.newFixedThreadPool(100);
		if(fixedThreadPool.submit(task).get() == null){
			System.out.printf("the fixedThreadPoolExecutorService has succeeded at %s \n",new Date());
		}
		ExecutorService singleThreadExecutorService = Executors.newSingleThreadExecutor();
		if(singleThreadExecutorService.submit(task).get() == null){
			System.out.printf("the singleThreadPoolExecutorService has succeeded at %s \n",new Date());
		}
		ExecutorService es = Executors.newCachedThreadPool();
		if(es.submit(task, Boolean.TRUE).get().equals(Boolean.TRUE))
			System.out.println("Job has finished!");
		ScheduledExecutorService scheduledThreadExecutorService = Executors.newScheduledThreadPool(10);
		if(scheduledThreadExecutorService.schedule(task, 30, TimeUnit.SECONDS).get()==null){
			System.out.printf("the scheduledThreadExecutorService has succeeded at %s \n",new Date());
		}
		scheduledThreadExecutorService.scheduleAtFixedRate(task, 0, 5, TimeUnit.SECONDS);
	}
	public static void main(String[] args) {
		try {
			new ExecutorsDemo().test();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
class DemonstrationRunnable implements Runnable{
	int i = 0;
	@Override
	public void run() {
		try {
			TimeUnit.SECONDS.sleep(1);
		} catch (InterruptedException e) {
			e.printStackTrace();
			System.out.println(ExceptionUtils.getFullStackTrace(e));
		}
//		System.out.println(Thread.currentThread().getName());
		System.out.printf("Hello at %s +%d\n",DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"),i++);
	}
	
}