package com.testorg.learning.sample.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;


@Component
public class Job1 extends QuartzJobBean 
{
	private static final Logger logger = LoggerFactory.getLogger(Job1.class);
	private String key1;
	private String key2;

	public void setKey1(String key1)
	{
	        this.key1 = key1;
	}

	public void setKey2(String key2)
	{
	        this.key2 = key2;
	}
	    
	public Job1() 
	{
    
	}

	 @Override
	 protected void executeInternal(JobExecutionContext jobContext) throws JobExecutionException
	 {
        try 
        {
        	long db_Schedule_id = (long)jobContext.getMergedJobDataMap().get("DB_Job_Schedule_Id");
        	String jobName = (String)jobContext.getMergedJobDataMap().get("JobName");
        	logger.info(">>>>>> Starting "+ jobName + " DB Schedule Id:"+ db_Schedule_id + " | next fire time {}", jobContext.getTrigger().getNextFireTime());
	
        }
        catch(Exception je) 
        {
        	logger.error("error",je);
        }
    }
}
