package com.usst.recommend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.task.SimpleAsyncTaskExecutor;
import org.springframework.core.task.SyncTaskExecutor;
import org.springframework.core.task.support.TaskExecutorAdapter;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.scheduling.timer.TimerTaskExecutor;
import org.springframework.test.context.ActiveProfiles;

public class SpringExecutorsDemo {
	@Autowired
	private SimpleAsyncTaskExecutor asyncTaskExecutor;
	@Autowired
	private SyncTaskExecutor syncTaskExecutor;
	@Autowired
	private TaskExecutorAdapter taskExecutorAdapter;
//	private TimerTaskExecutor timerTaskExecutorWithScheduledTimerTasks;
	@Autowired
	private TimerTaskExecutor timerTaskExecutorWithoutScheduledTimerTasks;
	@Autowired
	private ThreadPoolTaskExecutor threadPoolTaskExecutor;
	@Autowired
	private DemonstrationRunnable task;
	
	public void submitJobs(){
//		syncTaskExecutor.execute(task);
//		taskExecutorAdapter.submit(task);
//		asyncTaskExecutor.submit(task);
//		timerTaskExecutorWithoutScheduledTimerTasks.submit(task);
		for(int i=0;i<500;i++){
			threadPoolTaskExecutor.submit(task);
		}
	}
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		SpringExecutorsDemo demo = (SpringExecutorsDemo) ac.getBean("springExecutorsDemo");
		demo.submitJobs();
	}
}
