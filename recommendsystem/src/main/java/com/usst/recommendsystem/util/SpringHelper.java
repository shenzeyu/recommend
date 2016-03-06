package com.usst.recommendsystem.util;

import javax.servlet.ServletContext;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class SpringHelper {
	private static ServletContext servletContext = null;

	public static void bindSessionContext(ServletContext servletContext) {
		if (servletContext == null) {
			servletContext = servletContext;
		}
	}

	public static Object getBean(String beanId) {
		WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext(); 
		return context.getBean(beanId);
	}

	public static ServletContext getServletContext() {
		return servletContext;
	}
}
