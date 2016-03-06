package com.usst.recommendsystem.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.apache.log4j.Logger;

import com.usst.recommendsystem.domin.SysUser;


public class AdminSessionListener implements HttpSessionAttributeListener {
	private static final Logger logger = Logger.getLogger(AdminSessionListener.class);

	public void attributeAdded(HttpSessionBindingEvent event) {
		String sessionAttributeName = event.getName();
		if ("loginUser".equals(sessionAttributeName)) {
			HttpSession session = event.getSession();
			String id = session.getId() + session.getCreationTime();

			SysUser systemUser = (SysUser) event.getValue();
			synchronized (this) {
				Static.ADMIN_LOGIN_USER_SUM += 1;
				Static.ADMIN_LOGIN_USERS.put(id, systemUser);

				log();
			}
		}
	}

	public void attributeRemoved(HttpSessionBindingEvent event) {
		String sessionAttributeName = event.getName();
		if ("loginUser".equals(sessionAttributeName)) {
			HttpSession session = event.getSession();
			String id = session.getId() + session.getCreationTime();
			synchronized (this) {
				Static.ADMIN_LOGIN_USER_SUM -= 1;
				Static.ADMIN_LOGIN_USERS.remove(id);

				log();
			}
		}
	}

	public void attributeReplaced(HttpSessionBindingEvent event) {
		String sessionAttributeName = event.getName();
		if ("loginUser".equals(sessionAttributeName)) {
			HttpSession session = event.getSession();
			String id = session.getId() + session.getCreationTime();

			SysUser systemUser = (SysUser) event.getValue();
			synchronized (this) {
				Static.ADMIN_LOGIN_USERS.put(id, systemUser);

				log();
			}
		}
	}

	private void log() {
		logger.info("admin login user count:" + Static.ADMIN_LOGIN_USER_SUM);
		logger.info("admin login user :" + Static.ADMIN_LOGIN_USERS);
	}
}
