package com.testorg.learning.sample;

/**
 * Sample Application !
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello from Sample Application");
        if (args!=null && args.length >= 1 )
        {
        	if (args[0].equalsIgnoreCase("1"))
        		System.out.println(">>>>>> Option 1");
        	else if (args[0].equalsIgnoreCase("2"))
        		System.out.println(">>>>>> Option 2");
        }
    }
}
