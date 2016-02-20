package com.usst.code.struct;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.usst.app.customer.model.Customer;
import com.usst.app.system.user.model.SysUser;
import com.usst.code.bean.Base;
import com.usst.code.util.PageInfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

public class BaseAction extends ActionSupport {
	private static final Logger logger = Logger.getLogger(BaseAction.class);
	private int page;
	private int rows;
	protected Map<String, Object> jsonMap = new HashMap();
	protected String todo;
	protected String appType;

	public HttpServletResponse getResponse() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletResponse) ctx.get("com.opensymphony.xwork2.dispatcher.HttpServletResponse");
	}

	public HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
		return (HttpServletRequest) ctx.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
	}

	public void responseFlag(boolean flag) {
		try {
			getResponse().getWriter().write(Boolean.toString(flag));
		} catch (IOException e) {
			logger.error("error occur when response success flag!", e);
		}
	}

	public void responseFlag(String responseInfo) {
		try {
			getResponse().getWriter().write(responseInfo);
		} catch (IOException e) {
			logger.error("error occur when response success flag!", e);
		}
	}

	public PageInfo createPageInfo() {
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageSize(this.rows);
		pageInfo.setPageIndex(this.page);
		return pageInfo;
	}

	public SysUser getSessionUserInfo() {
		return (SysUser) getRequest().getSession().getAttribute("loginUser");
	}

	public Customer getSessionCustomerInfo() {
		return (Customer) getRequest().getSession().getAttribute("loginCustomer");
	}

	protected void initModel(boolean isCreate, Base model, Base loginMan) {
		String id = loginMan.getId();
		String name = loginMan.getName();
		if (isCreate) {
			model.setCreatorId(id);
			model.setCreatorName(name);
			model.setCreateTime(new Date());
			if (StringUtils.isBlank(model.getState())) {
				model.setState("s");
			}
			model.setFlowState(Integer.valueOf(0));
		} else {
			model.setModifierId(id);
			model.setModifierName(name);
			model.setModifyTime(new Date());
		}
	}

	public int getPage() {
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return this.rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public Map<String, Object> getJsonMap() {
		return this.jsonMap;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public String getTodo() {
		return this.todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public String getAppType() {
		return this.appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}
}
