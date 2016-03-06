package com.usst.recommendsystem.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.usst.recommendsystem.util.SpringHelper;


public class SystemFilter implements Filter {
	private SystemFilterService systemFilterService;
	public static String[] adminIgnoreList;
	public static String adminLoginUrl;
	public static String[] frontIgnoreList;
	public static String frontLoginUrl;

	public void init(FilterConfig filterConfig) throws ServletException {
		String adminIgnoreUrl = filterConfig.getInitParameter("adminIgnoreUrl");
		adminLoginUrl = filterConfig.getInitParameter("adminLoginUrl");
		if (StringUtils.isNotBlank(adminIgnoreUrl)) {
			adminIgnoreList = adminIgnoreUrl.split(",");
		}
		String frontIgnoreUrl = filterConfig.getInitParameter("frontIgnoreUrl");
		frontLoginUrl = filterConfig.getInitParameter("frontLoginUrl");
		if (StringUtils.isNotBlank(frontIgnoreUrl)) {
			frontIgnoreList = frontIgnoreUrl.split(",");
		}
		this.systemFilterService = ((SystemFilterService) SpringHelper.getBean("systemFilterService"));
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		this.systemFilterService.dofilter(request, response);
		chain.doFilter(servletRequest, servletResponse);
	}

	public void destroy() {
	}

	public static boolean isNotNeedFilter(String uri) {
		boolean isNotNeedFilter = false;
		if (-1 != uri.indexOf("!")) {
			if (adminIgnoreList != null) {
				for (String ignoreUrl : adminIgnoreList) {
					isNotNeedFilter = -1 != uri.indexOf(ignoreUrl);
					if (isNotNeedFilter) {
						break;
					}
				}
			}
		} else if (frontIgnoreList != null) {
			for (String ignoreUrl : frontIgnoreList) {
				isNotNeedFilter = -1 != uri.indexOf(ignoreUrl);
				if (isNotNeedFilter) {
					break;
				}
			}
		}
		return isNotNeedFilter;
	}

	public static boolean isLogin(HttpServletRequest request) {
		boolean isLogin = false;
		String uri = request.getRequestURI();
		boolean isNotNeedFilter = isNotNeedFilter(uri);
		if (-1 != uri.indexOf("!")) {
			if ((!isNotNeedFilter) && (request.getSession().getAttribute("loginUser") != null)) {
				isLogin = true;
			}
		} else if ((!isNotNeedFilter) && (request.getSession().getAttribute("loginCustomer") != null)) {
			isLogin = true;
		}
		return isLogin;
	}
	@Autowired
	public void setSystemFilterService(SystemFilterService systemFilterService) {
		this.systemFilterService = systemFilterService;
	}
	
}
