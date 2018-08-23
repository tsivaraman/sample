package com.testorg.learning.sample;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.quartz.JobDataMap;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import com.testorg.learning.sample.job.Job1;



@Service
public class SchedulerJobService
{
	private static final Logger logger = LoggerFactory.getLogger(SchedulerJobService.class);
    @Autowired
    private SchedulerFactoryBean schedulerFactoryBean;

    @Autowired
    SchedulerJobFactory schedulerJobFactory;

    @Autowired
    SchedulerTriggerFactory schedulerTriggerFactory;
    
  	@Autowired
    private Environment environment;
	
   
    public void setupJobs() throws ParseException, SchedulerException 
    {
    	scheduleJobs();
    }
    @PostConstruct
    /* This method will instantiate the approrpriate java class from LEARN_API_SYNC_JOB_SCHEDULE table.
    * Quartz framework will schedule all the jobs and its frequency specified in the above table.
    * setupJobs include both Injest and Egress component Jobs.
    * */
    private Date scheduleJobs() throws ParseException, SchedulerException
    {
    	
    	 Job1 job1obj = new Job1();
         String jobName = "Job1",
        		triggerName ="Job1Trigger",
        		frequency ="0/15 * * * * ?";
         
    	 JobDataMap jMap = new JobDataMap();
         jMap.put("JobName", jobName);
         jMap.put("DB_Job_Schedule_Id", new Long(1));
         jMap.put("Last_Run_At", new Date());
         String job_class = "com.testorg.learning.sample.job.Job1";
        
         Class jobclass = null;
         try 
         {
        	 jobclass = Class.forName(job_class);
         }
         catch(ClassNotFoundException cne) 
         {
        	 logger.error("scheduleJobError", cne);
         }
         
        
         
         JobDetailFactoryBean jdfb = schedulerJobFactory.job(jobclass, jMap, jobName);
         CronTriggerFactoryBean stfb = schedulerTriggerFactory.jobTrigger(jdfb.getObject(), frequency, triggerName);
         return schedulerFactoryBean.getScheduler().scheduleJob(jdfb.getObject(), stfb.getObject());
    }
    
}