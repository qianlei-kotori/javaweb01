package com.ql.filter;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class CommonListener
 *
 */
@WebListener
public class CommonListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public CommonListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext servletContext = arg0.getServletContext();
        String ctx = servletContext.getContextPath();
        servletContext.setAttribute("ctx", ctx);
        servletContext.setAttribute("js", ctx+"/js");
        servletContext.setAttribute("css", ctx+"/css");
    }
	
}
