package com.testorg.learning.sample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.jms.activemq.ActiveMQAutoConfiguration;
import org.springframework.boot.autoconfigure.jmx.JmxAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 * Sample Application !
 *
 */
//@ComponentScan("com.testorg.learning")
@ComponentScan
@SpringBootApplication
//@SpringBootApplication(exclude = { ActiveMQAutoConfiguration.class, JmxAutoConfiguration.class, DataSourceTransactionManagerAutoConfiguration.class })
 
public class App 
{
	private static final Logger logger = LoggerFactory.getLogger(App.class);
    public static void main( String[] args )
    {
        try 
        {
        	logger.info(">>>>> Starting the Sample App using Spring Boot");
        	SpringApplication.run(App.class, args);
         } 
        catch(Exception e) 
        {
        	e.printStackTrace(System.out);
        }
   
    }
}
