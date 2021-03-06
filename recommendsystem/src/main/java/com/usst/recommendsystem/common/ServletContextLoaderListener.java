package com.usst.recommendsystem.common;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.usst.recommendsystem.util.SpringHelper;


public class ServletContextLoaderListener implements ServletContextListener {
	private Logger logger = Logger.getLogger(ServletContextLoaderListener.class);

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext servletContext = servletContextEvent.getServletContext();
		Static.SERVLET_CONTEXT_PATH = servletContext.getRealPath("");
		this.logger.info("init SERVLET_CONTEXT_PATH:" + Static.SERVLET_CONTEXT_PATH);
		Static.APACHE_CONTEXT_PATH = Static.SERVLET_CONTEXT_PATH;
		this.logger.info("init APACHE_CONTEXT_PATH:" + Static.APACHE_CONTEXT_PATH);
		SpringHelper.bindSessionContext(servletContext);
		this.logger.info("bindSessionContext");
	}

	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		this.logger.info("contextDestroyed");
	}
}
