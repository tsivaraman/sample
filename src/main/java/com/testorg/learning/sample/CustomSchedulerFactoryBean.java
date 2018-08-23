package com.testorg.learning.sample;

import javax.sql.DataSource;

import org.springframework.scheduling.quartz.SchedulerFactoryBean;

public class CustomSchedulerFactoryBean extends SchedulerFactoryBean
{
	@Override
    public void setDataSource(DataSource dataSource)
    {
        
		
    }
}
